import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../components/com_time_picker.dart';
import '../../../components/components.dart';
import '../../../core/core.dart';
import '../register_tournament.dart';
import '../widgets/widgets.dart';
import 'maps_screen.dart';

@RoutePage()
class RegisterTournamentScreen extends StatefulWidget {
  const RegisterTournamentScreen({super.key});

  @override
  RegisterTournamentScreenState createState() =>
      RegisterTournamentScreenState();
}

class RegisterTournamentScreenState extends State<RegisterTournamentScreen> {
  LatLng _currentPosition = const LatLng(-12.0323798, -77.0909804);
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log("El servicio de ubicación no está habilitado.");
      return;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log("Permiso de ubicación denegado");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log("Permiso de ubicación denegado permanentemente");
      return;
    }

    _initCurrentLocation();
  }

  Future<void> _initCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      log("Error al obtener ubicación actual: $e");
    }
  }

  Future<void> _openFullScreenMap() async {
    final LatLng? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MapsScreen(initialPosition: _currentPosition),
      ),
    );

    if (result != null) {
      setState(() {
        _currentPosition = result;
        _getAddressFromLatLng(result);
      });
    }
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
          locationController.text =
              "${place.street}, ${place.locality}, ${place.country}";
        });
      }
    } catch (e) {
      log("Error al obtener dirección: $e");
      setState(() {
        locationController.text = "Dirección no disponible";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterTournamentController()),
        ChangeNotifierProvider(
            create: (context) => RegisterTournamentVm(context.read())),
      ],
      child: Consumer<RegisterTournamentVm>(
        builder: (context, viewModel, _) {
          final controller = context.read<RegisterTournamentController>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ComColors.blue500,
              foregroundColor: ComColors.white,
              centerTitle: true,
              title: Text(
                'Registra tu torneo',
                style: ComTextStyle.h6.white,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(ds16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: ds4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ds16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(ds16),
                        child: Column(
                          children: [
                            _buildSectionTitle('Datos del Torneo'),
                            _buildTextInput(
                              controller: controller.nameController,
                              labelText: 'Nombre del Torneo',
                            ),
                            _buildTextInput(
                              controller: controller.descriptionController,
                              labelText: 'Descripción',
                            ),
                            _buildDatePicker(
                              labelText: 'Fecha de Inicio',
                              onDateSelected: (date) {},
                            ),
                            _buildDatePicker(
                              labelText: 'Fecha de finalización',
                              onDateSelected: (date) {},
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextInput(
                                    controller: controller.locationController,
                                    labelText: 'Ubicación',
                                  ),
                                ),
                                IconButton(
                                  onPressed: _openFullScreenMap,
                                  icon: const Icon(Icons.location_on_outlined),
                                ),
                              ],
                            ),
                            _buildTextInput(
                              controller: controller.stadiumController,
                              labelText: 'Estadio',
                            ),
                          ],
                        ),
                      ),
                    ),
                    gap8,
                    ComDivider(),
                    gap8,
                    Card(
                      elevation: ds4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ds16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(ds16),
                        child: Column(
                          children: [
                            _buildSectionTitle('Registrar Partidos'),
                            _buildDatePicker(
                              labelText: 'Fecha de Inicio',
                              onDateSelected: (date) {},
                            ),
                            ComTimePicker(
                              matchHourController:
                                  controller.matchDateController,
                              matchMinutesController:
                                  controller.matchMinutesController,
                            ),
                            _buildTextInput(
                              controller: controller.teamLocalController,
                              labelText: 'Equipo Local',
                            ),
                            _buildTextInput(
                              controller: controller.teamVisitantController,
                              labelText: 'Equipo Visitante',
                            ),
                            gap4,
                            ComButton(
                              onPressed: viewModel.addMatch,
                              text: 'Agregar',
                              height: ds25,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: ds10),
                              backgroundColor: null,
                              labelColor: ComColors.blue600,
                              borderColor: Colors.transparent,
                              isActivatedIcon: true,
                            ),
                            if (viewModel.matches.isNotEmpty) ...[
                              gap4,
                              MatchList(
                                matches: viewModel.matches,
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                    gap16,
                    ComButton(
                      alignment: Alignment.center,
                      onPressed: () {
                        viewModel.registerTournament(context);
                      },
                      text: 'Registrar Torneo y Partidos',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextInput({
    required TextEditingController controller,
    required String labelText,
  }) {
    return ComInputText(
      controller: controller,
      labelText: labelText,
      keyboardType: TextInputType.text,
    );
  }

  Widget _buildDatePicker({
    required String labelText,
    required Function(DateTime?) onDateSelected,
  }) {
    return ComDatePicker.dateSelection(
      labelText: labelText,
      initialDate: DateTime.now(),
      onDateSelected: onDateSelected,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: ComTextStyle.h6);
  }
}
