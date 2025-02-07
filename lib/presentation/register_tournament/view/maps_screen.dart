import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  final LatLng initialPosition;

  const MapsScreen({super.key, required this.initialPosition});

  @override
  MapsScreenState createState() => MapsScreenState();
}

class MapsScreenState extends State<MapsScreen> {
  late LatLng _currentPosition;

  @override
  void initState() {
    super.initState();
    _currentPosition = widget.initialPosition;
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
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context, _currentPosition);
            },
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 14,
        ),
        onCameraMove: _onCameraMove,
        markers: {
          Marker(
            markerId: MarkerId('currentLocation'),
            position: _currentPosition,
            icon: BitmapDescriptor.defaultMarker,
          ),
        },
      ),
    );
  }
}
