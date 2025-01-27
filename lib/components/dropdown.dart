import 'package:flutter/material.dart';

import '../core/core.dart';

class ComDropdown extends StatefulWidget {
  const ComDropdown({
    required this.items,
    this.borderColor,
    this.label = '',
    this.messageLabel = '',
    this.widthBorder = ds1,
    this.hintText = 'Selecciona una opción',
    this.borderRadius = ds8,
    this.isOptional = false,
    this.onChanged,
    this.initialValue,
    this.paddingContent = const EdgeInsets.symmetric(vertical: ds8),
    this.controller,
    super.key,
  });

  final List<String> items;
  final String? label;
  final Color? borderColor;
  final double widthBorder;
  final String messageLabel;
  final String hintText;
  final double borderRadius;
  final bool isOptional;
  final ValueChanged<String?>? onChanged;
  final String? initialValue;
  final EdgeInsets paddingContent;
  final TextEditingController? controller;

  @override
  State<ComDropdown> createState() => _DropdownState();
}

class _DropdownState extends State<ComDropdown> {
  Color? borderColor;
  String? selectedValue;
  TextEditingController? internalController;

  @override
  void initState() {
    super.initState();
    borderColor = widget.borderColor ?? ComColors.black500;

    internalController = widget.controller ?? TextEditingController();

    internalController!.addListener(() {
      if (mounted) {
        setState(() {
          if (internalController!.text.isEmpty) {
            borderColor = ComColors.black500;
          } else {
            selectedValue = internalController!.text.isNotEmpty &&
                    widget.items.contains(internalController!.text)
                ? internalController!.text
                : null;
          }
        });
      }
    });

    if (internalController!.text.isNotEmpty) {
      selectedValue = widget.items.contains(internalController!.text)
          ? internalController!.text
          : null;
    }
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.messageLabel.isEmpty
              ? gap0
              : Padding(
                  padding: const EdgeInsets.only(bottom: ds2),
                  child: Row(
                    children: [
                      Text(
                        widget.messageLabel,
                        style: ComTextStyle.overline.black600,
                      ),
                      const Spacer(),
                      if (widget.isOptional)
                        Text(
                          '*Opcional',
                          style: ComTextStyle.overline.white800,
                        ),
                    ],
                  ),
                ),
          DropdownButtonFormField<String>(
            value: internalController!.text.isEmpty
                ? null
                : internalController!.text,
            style: textStyle,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: ds16),
              label: Text(
                widget.label!,
                style: textStyle,
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
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor!,
                  width: widget.widthBorder,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
            hint: Text(
              widget.hintText,
              style: ComTextStyle.caption.white800,
            ),
            icon: Icon(Icons.keyboard_arrow_down, size: 20),
            items: widget.items.map((method) {
              return DropdownMenuItem<String>(
                value: method,
                child: Text(
                  method,
                  style: textStyle,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (mounted) {
                setState(() {
                  internalController!.text = value ?? '';
                  selectedValue = value;
                  borderColor = ComColors.green500;
                });

                widget.onChanged?.call(value);
              }
            },
          ),
        ],
      ),
    );
  }
}
