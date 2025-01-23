import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../core/style/style.dart';

class MyDataSource extends DataGridSource {
  MyDataSource(this.data);

  final List<Map<String, dynamic>> data;

  @override
  List<DataGridRow> get rows => data.map((row) {
        return DataGridRow(
          cells: row.entries
              .map((entry) => DataGridCell<String>(
                    columnName: entry.key,
                    value: entry.value,
                  ))
              .toList(),
        );
      }).toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return Container(child: _buildCell(cell));
      }).toList(),
    );
  }

  Widget _buildCell(DataGridCell cell) {
    final colorMap = {
      's1': ComColors.gs100,
      's2': ComColors.gs200,
      's3': ComColors.gs300,
      's4': ComColors.gs400,
      's5': ComColors.gs500,
      'resultado': ComColors.gs600,
      'puntaje': ComColors.gs700,
      'puntos': ComColors.gs800,
    };

    final cellColor = colorMap[cell.columnName] ?? Colors.transparent;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: cellColor,
        border: Border.all(color: ComColors.gs400),
      ),
      child: Text(
        cell.value.toString(),
        style: ComTextStyle.body2.w900,
      ),
    );
  }
}
