/*import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

@RoutePage()
class ComLocationScreen extends StatefulWidget {
  const ComLocationScreen({
    super.key,
  });

  @override
  State<ComLocationScreen> createState() => _ComLocationScreenState();
}

class _ComLocationScreenState extends State<ComLocationScreen> {
  bool _isFetchingLocation = false;
  String? _errorMessage;

  TextEditingController locationController = TextEditingController();

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isFetchingLocation = true;
      _errorMessage = null;
    });

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('El servicio de ubicación está desactivado.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Los permisos de ubicación han sido denegados.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
            'Los permisos de ubicación están permanentemente denegados.');
      }

      final Position position = await Geolocator.getCurrentPosition();

      locationController.text = '${position.latitude}, ${position.longitude}';
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isFetchingLocation = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar Ubicación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: 'Ubicación',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isFetchingLocation ? null : _getCurrentLocation,
              child: _isFetchingLocation
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Obtener ubicación actual'),
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 16.0),
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
*/
