import 'package:flutter/material.dart';
import 'package:proyecto_torneos/core/style/app_text_style.dart';

class InputText extends StatelessWidget {
  const InputText({
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.number,
    super.key,
  });

  final String labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: ComTextStyle.caption.gs800,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      keyboardType: TextInputType.number,
      validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
    );
  }
}
