import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/core.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({
    super.key,
  });

  @override
  MapsScreenState createState() => MapsScreenState();
}

class MapsScreenState extends State<MapsScreen> {
  late LatLng _currentPosition =
      const LatLng(-12.039229400873836, -77.0859856903553);
  String _currentAddress = "Obteniendo dirección...";

  @override
  void initState() {
    super.initState();
    _initCurrentLocation();
  }

  Future<void> _initCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      String? address =
          await PermissionHandler.getAddressFromLatLng(_currentPosition);

      setState(() {
        _currentAddress = address;
      });
    } catch (e) {
      log("Error al obtener ubicación actual: $e");
    }
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _currentPosition = position.target;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicación en el Mapa'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: 14,
            ),
            onCameraMove: _onCameraMove,
            onCameraIdle: () async {
              String? address = await PermissionHandler.getAddressFromLatLng(
                  _currentPosition);

              setState(() {
                _currentAddress = address;
              });
              log("Dirección: $address");
            },
            markers: {
              Marker(
                markerId: MarkerId('_currentPosition'),
                position: _currentPosition,
                icon: BitmapDescriptor.defaultMarker,
              ),
            },
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 5),
                ],
              ),
              child: Text(
                _currentAddress,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              Navigator.pop(context, {
                'position': _currentPosition,
                'address': _currentAddress,
              });
            }
          });
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
