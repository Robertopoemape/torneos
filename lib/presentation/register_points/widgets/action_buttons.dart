import 'package:flutter/material.dart';

import '../../../core/common/app_gap.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    required this.canAddSet,
    required this.onAddSet,
    required this.onSave,
    super.key,
  });

  final bool canAddSet;
  final VoidCallback onAddSet;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (canAddSet)
          Expanded(
            child: ElevatedButton(
              onPressed: onAddSet,
              child: const Text('Siguiente set'),
            ),
          ),
        space16,
        Expanded(
          child: ElevatedButton(
            onPressed: onSave,
            child: const Text('Guardar'),
          ),
        ),
      ],
    );
  }
}
