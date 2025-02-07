import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<bool> location() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log("❌ El servicio de ubicación no está habilitado.");
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log("❌ Permiso de ubicación denegado.");
        await openPermissionSettings();
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log("❌ Permiso de ubicación denegado permanentemente.");
      await openPermissionSettings();
      return false;
    }

    log("✅ Permiso de ubicación concedido.");
    return true;
  }

  /// Solicita el permiso de cámara y devuelve `true` si fue concedido.
  static Future<bool> camera() async {
    var statusCamera = await Permission.camera.request();
    if (statusCamera.isGranted) {
      log("✅ Permiso concedido para la cámara.");
      return true;
    } else {
      log("❌ Permiso no concedido para la cámara.");
      await openPermissionSettings();
      return false;
    }
  }

  /// Abre la configuración de permisos de la app.
  static Future<void> openPermissionSettings() async {
    log("⚙️ Abriendo configuración de permisos...");
    await openAppSettings();
  }

  static Future<String> getAddressFromLatLng(LatLng position) async {
    String currentAddress = '';
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        currentAddress = "${place.street}, ${place.locality}, ${place.country}";
      }
    } catch (e) {
      log("Error al obtener dirección: $e");
      currentAddress = "Dirección no disponible";
    }
    return currentAddress;
  }
}
