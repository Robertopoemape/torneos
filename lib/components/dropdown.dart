import 'dart:developer';

import 'package:flutter/material.dart';

import '../core/core.dart';

class ComDropdown extends StatefulWidget {
  const ComDropdown({
    required this.items,
    this.borderColor,
    this.label = '',
    this.messageLabel = '',
    this.widthBorder = 1,
    this.hintText = 'Selecciona una opción',
    this.borderRadius = ds8,
    this.isOptional = false,
    this.onChanged,
    this.initialValue,
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

  @override
  State<ComDropdown> createState() => _DropdownState();
}

class _DropdownState extends State<ComDropdown> {
  String? selectedItem;
  Color? borderColor;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    log(widget.borderColor.toString());
    borderColor = widget.borderColor ?? ComColors.sec500;
    log(widget.borderColor.toString());

    if (widget.initialValue != null &&
        widget.items.contains(widget.initialValue)) {
      selectedItem = widget.initialValue;
      controller.text = selectedItem!;
    } else {
      selectedItem = null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.messageLabel.isEmpty ? gap2 : gap8,
        Padding(
          padding: const EdgeInsets.only(bottom: ds2),
          child: Row(
            children: [
              Text(
                widget.messageLabel,
                style: ComTextStyle.overline.sec600,
              ),
              const Spacer(),
              if (widget.isOptional)
                Text(
                  '*Opcional',
                  style: ComTextStyle.overline.gs800,
                ),
            ],
          ),
        ),
        SizedBox(
          height: 48,
          child: DropdownButtonFormField<String>(
            value: selectedItem,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: ds16),
              label: Text(widget.label!, style: textStyle),
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
              style: ComTextStyle.caption.gs800,
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
                  selectedItem = value;
                  if (value != null) {
                    controller.text = value;

                    borderColor = ComColors.succ500;
                  } else {
                    controller.clear();
                  }
                });
                widget.onChanged?.call(value);
              }
            },
          ),
        ),
        gap4,
      ],
    );
  }
}
