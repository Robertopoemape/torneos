import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../core/core.dart';
import '../presentation/register_tournament/controller/register_tournament_vball_controller.dart';

class ComTimePicker extends StatefulWidget {
  const ComTimePicker({super.key});

  @override
  ComTimePickerState createState() => ComTimePickerState();
}

class ComTimePickerState extends State<ComTimePicker> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;

        final formattedTime = _getFormattedTime();
        final controller = context.read<RegisterTournamentController>();

        controller.matchHourController.text = formattedTime.substring(0, 1);
        controller.matchMinutesController.text = formattedTime.substring(2, 4);
        controller.matchMeridiemController.text = formattedTime.substring(5, 7);
      });
    }
  }

  String _getFormattedTime() {
    final DateTime now = DateTime.now();
    final DateTime formattedTime = DateTime(
      now.year,
      now.month,
      now.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );
    return DateFormat.jm().format(formattedTime);
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<RegisterTournamentController>();
    final timeString = _getFormattedTime();
    log(timeString);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ds13, vertical: ds8),
      margin: const EdgeInsets.symmetric(vertical: ds6),
      decoration: BoxDecoration(
        color: const Color(0xFFf4ecf4),
        borderRadius: BorderRadius.circular(ds8),
        border: Border.all(color: ComColors.black500, width: ds1),
        boxShadow: [
          BoxShadow(
            color: ComColors.black800.withOpacity(0.1),
            blurRadius: ds8,
            offset: const Offset(0, ds4),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildTimeInput(controller.matchHourController, 'Hora'),
          const SizedBox(width: 8),
          Text(':', style: ComTextStyle.h5),
          const SizedBox(width: 8),
          _buildTimeInput(controller.matchMinutesController, 'Mts.'),
          const Spacer(),
          _buildMeridiemText(controller.matchMeridiemController.text),
          const Spacer(),
          const SizedBox(width: 8),
          _buildInstructionButton()
        ],
      ),
    );
  }

  Widget _buildTimeInput(TextEditingController controller, String label) {
    return Container(
      width: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ComColors.black500,
          width: ds2,
        ),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        style: ComTextStyle.h6,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: ds6, bottom: ds2),
          border: InputBorder.none,
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }

  Widget _buildMeridiemText(String meridiem) {
    return Text(
      meridiem,
      style: ComTextStyle.h6.w900.black800,
    );
  }

  Widget _buildInstructionButton() {
    return InkWell(
      onTap: _pickTime,
      child: Container(
        padding: const EdgeInsets.all(ds8),
        constraints: const BoxConstraints(maxWidth: ds200),
        decoration: BoxDecoration(
          color: ComColors.blue200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ComColors.blue600,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.access_time, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
