import 'package:flutter/material.dart';

import '../core/core.dart';

class ComInputText extends StatefulWidget {
  const ComInputText({
    required this.controller,
    required this.labelText,
    this.onChangedText,
    this.widthBorder = ds1,
    this.borderRadius = ds8,
    this.borderColor,
    this.keyboardType = TextInputType.number,
    this.readOnly = false,
    this.paddingContent = const EdgeInsets.symmetric(vertical: ds8),
    this.initialValue,
    this.fontSize,
    super.key,
  });

  final String labelText;
  final double? widthBorder;
  final double? borderRadius;
  final Color? borderColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChangedText;
  final bool readOnly;
  final EdgeInsets paddingContent;
  final String? initialValue;
  final double? fontSize;

  @override
  State<ComInputText> createState() => _ComInputTextState();
}

class _ComInputTextState extends State<ComInputText> {
  Color? borderColor;
  String messageLabel = '';
  TextEditingController? internalController;

  @override
  void initState() {
    super.initState();
    borderColor = widget.borderColor ?? ComColors.sec500;
    internalController = widget.controller ?? TextEditingController();

    // Asignar el valor inicial si está definido

    internalController!.addListener(() {
      if (mounted) {
        setState(() {
          if (internalController!.text.isEmpty) {
            borderColor = ComColors.sec500;
          }
          if (widget.initialValue != null) {
            internalController!.text = widget.initialValue!;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      internalController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.paddingContent,
      child: TextFormField(
        controller: widget.controller,
        style:
            ComTextStyle.body3.w400.gs1000.copyWith(fontSize: widget.fontSize),
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
            horizontal: ds16,
          ),
        ),
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        onChanged: (value) {
          //   if (!widget.isOptionalField) {
          setState(() {
            // valueLabel = value;
            if (value.isNotEmpty) {
              borderColor = ComColors.succ500;
              //   messageLabel = widget.successLabel;
              //isError = false;
            } else {
              messageLabel = 'Este campo no puede estar vacío';
              borderColor = ComColors.err500;
              //    isError = true;
            }
          });
          //    }
          if (widget.onChangedText != null) widget.onChangedText!(value);
        },
      ),
    );
  }
}
