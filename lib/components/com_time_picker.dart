import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  State<ComTimePicker> createState() => _ComTimePickerState();
}

class _ComTimePickerState extends State<ComTimePicker> {
  late Color borderColor;
  late TextEditingController hourController;
  late TextEditingController minutesController;
  TimeOfDay selectedTime = TimeOfDay.now();
  String matchMeridiem = '';

  @override
  void initState() {
    super.initState();

    borderColor = widget.borderColor ?? ComColors.black500;

    hourController = widget.matchHourController ?? TextEditingController();
    minutesController =
        widget.matchMinutesController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.matchHourController == null) hourController.dispose();
    if (widget.matchMinutesController == null) minutesController.dispose();
    super.dispose();
  }

  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;

        final formattedTime = _getFormattedTime();
        hourController.text = formattedTime.substring(0, 1);
        minutesController.text = formattedTime.substring(2, 4);
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
      selectedTime.hour,
      selectedTime.minute,
    );
    return DateFormat.jm().format(formattedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ds13, vertical: ds8),
      margin: const EdgeInsets.symmetric(vertical: ds6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ds8),
        border: Border.all(color: borderColor, width: ds1),
      ),
      child: Row(
        children: [
          _buildTimeInput(hourController, 'Hora'),
          const SizedBox(width: ds8),
          Text(':', style: ComTextStyle.h5),
          const SizedBox(width: ds8),
          _buildTimeInput(minutesController, 'Mts.'),
          const Spacer(),
          _buildMeridiemText(matchMeridiem),
          const Spacer(),
          _buildTimePickerButton(),
        ],
      ),
    );
  }

  Widget _buildTimeInput(TextEditingController controller, String label) {
    return Container(
      width: ds50,
      padding: const EdgeInsets.symmetric(horizontal: ds8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ds8),
        border: Border.all(
          color: borderColor,
          width: ds1,
        ),
      ),
      child: TextField(
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(2),
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
        style: ComTextStyle.h6,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: ds6),
          border: InputBorder.none,
          labelText: label,
          labelStyle: ComTextStyle.caption.white800,
        ),
        onChanged: (value) {
          setState(() {
            if (value.isNotEmpty) {
              borderColor = ComColors.green500;
            } else {
              borderColor = ComColors.red500;
            }
          });
        },
      ),
    );
  }

  Widget _buildMeridiemText(String meridiem) {
    return Text(
      meridiem,
      style: ComTextStyle.h6.w900.black800,
    );
  }

  Widget _buildTimePickerButton() {
    return InkWell(
      onTap: _pickTime,
      child: Container(
        padding: const EdgeInsets.all(ds8),
        decoration: BoxDecoration(
          color: ComColors.blue600,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.access_time,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
