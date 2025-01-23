// Fila para un set específico
import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../core/common/common.dart';

class SetInputRow extends StatelessWidget {
  const SetInputRow({
    required this.index,
    required this.localController,
    required this.visitantController,
    required this.onLocalScoreChanged,
    required this.onVisitantScoreChanged,
    super.key,
  });

  final int index;
  final TextEditingController localController;
  final TextEditingController visitantController;
  final ValueChanged<String> onLocalScoreChanged;
  final ValueChanged<String> onVisitantScoreChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: ds8),
      child: Column(
        children: [
          Text("${index + 1} Set"),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              _buildSetInput(
                label: 'Local',
                controller: localController,
                onChanged: onLocalScoreChanged,
              ),
              space8,
              _buildSetInput(
                label: 'Visitante',
                controller: visitantController,
                onChanged: onVisitantScoreChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSetInput({
    required String label,
    required TextEditingController controller,
    required ValueChanged<String> onChanged,
  }) {
    return SizedBox(
      width: 80,
      child: ComInputText(
        controller: controller,
        labelText: label,
        onChangedText: onChanged,
      ),
    );
  }
}
