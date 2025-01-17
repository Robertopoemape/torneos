import 'package:flutter/material.dart';

import '../core/core.dart';

class InputText extends StatefulWidget {
  const InputText({
    required this.controller,
    required this.labelText,
    required this.onChangedText,
    this.widthBorder = ds1,
    this.borderRadius = ds8,
    this.borderColor,
    this.keyboardType = TextInputType.number,
    super.key,
  });

  final String labelText;
  final double? widthBorder;
  final double? borderRadius;
  final Color? borderColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String) onChangedText;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  Color? borderColor;
  String messageLabel = '';
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.controller != null || widget.controller!.text.isEmpty) {
      borderColor = ComColors.sec500;
    } else {
      borderColor = widget.borderColor ?? ComColors.sec500;
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: ComTextStyle.caption.gs800,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor!,
            width: widget.widthBorder!,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor!,
            width: ds2,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius!),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor!,
            width: widget.widthBorder!,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius!),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      keyboardType: widget.keyboardType,
      validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
      onChanged: (value) {
        //   if (!widget.isOptionalField) {
        setState(() {
          // valueLabel = value;
          if (value.isNotEmpty) {
            borderColor = ComColors.pri600;
            //   messageLabel = widget.successLabel;
            //isError = false;
          } else {
            messageLabel = 'Este campo no puede estar vacío';
            borderColor = ComColors.err600;
            //    isError = true;
          }
        });
        //    }
        widget.onChangedText(value);
      },
    );
  }
}
