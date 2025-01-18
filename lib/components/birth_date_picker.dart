import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../core/core.dart';

class BirthDatePicker extends StatefulWidget {
  const BirthDatePicker({
    required this.labelText,
    this.onDateSelected,
    this.initialDate,
    this.widthBorder = ds1,
    this.borderRadius = ds8,
    this.paddingContent = const EdgeInsets.symmetric(vertical: ds8),
    this.hintText = "DD/MM/YYYY",
    super.key,
  });
  final String labelText;
  final ValueChanged<DateTime?>? onDateSelected;
  final DateTime? initialDate;
  final String hintText;
  final double widthBorder;
  final double borderRadius;
  final EdgeInsets paddingContent;

  @override
  State<BirthDatePicker> createState() => _BirthDatePickerState();
}

class _BirthDatePickerState extends State<BirthDatePicker> {
  Color? borderColor;
  late TextEditingController _dateController;
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  String? _errorMessage;

  @override
  void initState() {
    super.initState();

    borderColor = ComColors.sec500;
    _dateController = TextEditingController(
      text: widget.initialDate != null
          ? _dateFormat.format(widget.initialDate!)
          : '',
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  bool _isAdult(DateTime date) {
    final now = DateTime.now();
    final age = now.year - date.year;
    final isBirthdayPassed = now.month > date.month ||
        (now.month == date.month && now.day >= date.day);
    return age > 18 || (age == 18 && isBirthdayPassed);
  }

  void _validateAndSetDate(String value) {
    try {
      final parsedDate = _dateFormat.parseStrict(value);
      if (!_isAdult(parsedDate)) {
        setState(() {
          _errorMessage = "Debes ser mayor de edad.";
          borderColor = ComColors.err500;
        });
      } else {
        setState(() {
          _errorMessage = null;
          borderColor = ComColors.succ500;
        });
        widget.onDateSelected?.call(parsedDate);
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Fecha no válida.";
        borderColor = ComColors.err500;
      });
    }
  }

  String _formatInput(String input) {
    final cleanedInput = input.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();
    for (int i = 0; i < cleanedInput.length; i++) {
      buffer.write(cleanedInput[i]);
      if ((i == 1 || i == 3) && i < cleanedInput.length - 1) {
        buffer.write('/');
      }
    }
    return buffer.toString();
  }

  Future<void> _pickDateFromCalendar() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      final formattedDate = _dateFormat.format(pickedDate);
      _dateController.text = formattedDate;
      _validateAndSetDate(formattedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.paddingContent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _dateController,
            style: ComTextStyle.body3.w400.gs1000,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              TextInputFormatter.withFunction((oldValue, newValue) {
                final formatted = _formatInput(newValue.text);
                return TextEditingValue(
                  text: formatted,
                  selection: TextSelection.collapsed(offset: formatted.length),
                );
              }),
            ],
            decoration: InputDecoration(
                labelText: widget.labelText,
                labelStyle: ComTextStyle.caption.gs800,
                hintText: widget.hintText,
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: _pickDateFromCalendar,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor!,
                    width: widget.widthBorder,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor!,
                    width: ds2,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: ds16,
                  vertical: ds8,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor!,
                    width: widget.widthBorder,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                counter: null),
            keyboardType: TextInputType.datetime,
            onSubmitted: _validateAndSetDate,
            maxLength: 10,
            buildCounter: (BuildContext context,
                {required int currentLength,
                required bool isFocused,
                required int? maxLength}) {
              return null;
            },
          ),
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: ds2, left: ds8),
              child: Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red, fontSize: ds12),
              ),
            ),
        ],
      ),
    );
  }
}
