import 'package:flutter/material.dart';

import '../../../src/src.dart';

class ResultTableScreen extends StatelessWidget {
  final List<MatchData> matchData;

  const ResultTableScreen({
    super.key,
    required this.matchData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 10, // Ajusta el espaciado entre las columnas
          // dataRowMaxHeight: 50, // Ajusta la altura de las filas
          headingRowHeight: 30, // Ajusta la altura de la fila de encabezado
          //   dataRowMinHeight: 20,
          horizontalMargin: 8,
          dataRowMaxHeight: 30,
          dataRowMinHeight: 30,
          border: TableBorder.all(
            // Agrega bordes a la tabla
            color: Colors.grey, // Color del borde
            style: BorderStyle.solid, // Estilo sólido
            width: 1, // Grosor del borde
          ),
          columns: const [
            DataColumn(label: Align(child: Text('Pos.')), numeric: true),
            DataColumn(label: Text('Equipo')),
            DataColumn(label: Text('PJ')),
            DataColumn(label: Text('PG')),
            DataColumn(label: Text('PP')),
            DataColumn(label: Text('SF')),
            DataColumn(label: Text('SC')),
            DataColumn(label: Text('DFS')),
            DataColumn(label: Text('Ratio Sets')),
            DataColumn(label: Text('PTF')),
            DataColumn(label: Text('PTC')),
            DataColumn(label: Text('DFP')),
            DataColumn(label: Text('Ratio Puntos')),
            DataColumn(label: Text('2 a 0')),
            DataColumn(label: Text('2 a 1')),
            DataColumn(label: Text('1 a 2')),
            DataColumn(label: Text('0 a 2')),
          ],
          rows: matchData.map((data) {
            return DataRow(cells: [
              // Centrar la columna "Posición"
              DataCell(
                Align(
                  alignment: Alignment.center, // Centra el texto en la celda
                  child: Text(data.position.toString()),
                ),
              ),
              DataCell(Text(data.teamName)),
              DataCell(Text(data.stats.played.toString())),
              DataCell(Text(data.stats.won.toString())),
              DataCell(Text(data.stats.lost.toString())),
              DataCell(Text(data.stats.setsFor.toString())),
              DataCell(Text(data.stats.setsAgainst.toString())),
              DataCell(Text(data.stats.diffSets.toString())),
              DataCell(Text(data.stats.ratioSets.toString())),
              DataCell(Text(data.stats.totalPointsFor.toString())),
              DataCell(Text(data.stats.totalPointsAgainst.toString())),
              DataCell(Text(data.stats.diffPoints.toString())),
              DataCell(Text(data.stats.ratioPoints.toString())),
              DataCell(Text(data.stats.twoZero.toString())),
              DataCell(Text(data.stats.twoOne.toString())),
              DataCell(Text(data.stats.oneTwo.toString())),
              DataCell(Text(data.stats.zeroTwo.toString())),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
