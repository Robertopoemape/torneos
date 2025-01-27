import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/core.dart';

class ComTimePicker extends StatefulWidget {
  const ComTimePicker({
    required this.matchHourController,
    required this.matchMinutesController,
    this.borderColor,
    this.initialValue,
    super.key,
  });

  final TextEditingController? matchHourController;
  final TextEditingController? matchMinutesController;
  final Color? borderColor;
  final String? initialValue;

  @override
  ComTimePickerState createState() => ComTimePickerState();
}

class ComTimePickerState extends State<ComTimePicker> {
  Color? borderColor;
  TimeOfDay _selectedTime = TimeOfDay.now();
  TextEditingController? internalControllerHour;
  TextEditingController? internalControllerMinutes;
  String matchMeridiem = '';

  @override
  void initState() {
    super.initState();
    borderColor = widget.borderColor ?? const Color.fromRGBO(53, 67, 81, 1);
    internalControllerHour =
        widget.matchHourController ?? TextEditingController();
    internalControllerMinutes =
        widget.matchMinutesController ?? TextEditingController();

    internalControllerHour!.addListener(() {
      if (mounted) {
        setState(() {
          if (internalControllerHour!.text.isEmpty) {
            borderColor = ComColors.black500;
          }
          if (widget.initialValue != null) {
            internalControllerHour!.text = widget.initialValue!;
          }
        });
      }
    });
    internalControllerMinutes!.addListener(() {
      if (mounted) {
        setState(() {
          if (internalControllerMinutes!.text.isEmpty) {
            borderColor = ComColors.black500;
          }
          if (widget.initialValue != null) {
            internalControllerMinutes!.text = widget.initialValue!;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    if (widget.matchHourController == null ||
        widget.matchHourController == null) {
      internalControllerHour?.dispose();
      internalControllerMinutes?.dispose();
    }
    super.dispose();
  }

  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;

        final formattedTime = _getFormattedTime();
        // final controller = context.read<RegisterTournamentController>();

        internalControllerHour!.text = formattedTime.substring(0, 1);
        internalControllerMinutes!.text = formattedTime.substring(2, 4);
        matchMeridiem = formattedTime.substring(5, 7);
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
    final timeString = _getFormattedTime();
    log(timeString);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ds13, vertical: ds8),
      margin: const EdgeInsets.symmetric(vertical: ds6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ds8),
        border: Border.all(color: ComColors.black500, width: ds1),
      ),
      child: Row(
        children: [
          _buildTimeInput(internalControllerHour!, 'Hora'),
          space8,
          Text(':', style: ComTextStyle.h5),
          space8,
          _buildTimeInput(internalControllerMinutes!, 'Mts.'),
          const Spacer(),
          _buildMeridiemText(matchMeridiem),
          const Spacer(),
          space8,
          _buildInstructionButton()
        ],
      ),
    );
  }

  Widget _buildTimeInput(TextEditingController controller, String label) {
    return Container(
      width: ds50,
      padding: const EdgeInsets.symmetric(horizontal: ds8),
      decoration: BoxDecoration(
        color: ComColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ComColors.black500,
          width: ds1,
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
          labelStyle: ComTextStyle.caption.white800,
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
          borderRadius: BorderRadius.circular(ds8),
        ),
        child: Container(
          padding: const EdgeInsets.all(ds8),
          decoration: BoxDecoration(
            color: ComColors.blue600,
            borderRadius: BorderRadius.circular(ds20),
          ),
          child: const Icon(
            Icons.access_time,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
