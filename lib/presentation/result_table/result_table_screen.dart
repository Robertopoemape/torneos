import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/style/app_text_style.dart';
import '../../src/src.dart';

class ResultTableScreen extends StatelessWidget {
  const ResultTableScreen({super.key});

  Future<List<MatchData>> fetchMatchData() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('matches').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return MatchData.fromMap(data);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: FutureBuilder<List<MatchData>>(
        future: fetchMatchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos.'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay datos disponibles.'));
          }

          return MatchDataTable(matchData: snapshot.data!);
        },
      ),
    );
  }
}

// Widget para la tabla
class MatchDataTable extends StatelessWidget {
  final List<MatchData> matchData;

  const MatchDataTable({super.key, required this.matchData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: WidgetStateProperty.resolveWith(
          (states) => Colors.grey.shade300,
        ),
        dataRowColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? Colors.blue.shade50
              : null,
        ),
        columnSpacing: 20,
        headingRowHeight: 50,
        horizontalMargin: 10,
        border: TableBorder(
          horizontalInside: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        columns: [
          DataColumn(label: Text('Pos.', style: ComTextStyle.body2)),
          DataColumn(label: Text('Equipo', style: ComTextStyle.body2)),
          DataColumn(label: Text('PJ', style: ComTextStyle.body2)),
          DataColumn(label: Text('PG', style: ComTextStyle.body2)),
          DataColumn(label: Text('PP', style: ComTextStyle.body2)),
          DataColumn(label: Text('SF', style: ComTextStyle.body2)),
          DataColumn(label: Text('SC', style: ComTextStyle.body2)),
          DataColumn(label: Text('DFS', style: ComTextStyle.body2)),
          DataColumn(label: Text('Ratio Sets', style: ComTextStyle.body2)),
          DataColumn(label: Text('PTF', style: ComTextStyle.body2)),
          DataColumn(label: Text('PTC', style: ComTextStyle.body2)),
          DataColumn(label: Text('DFP', style: ComTextStyle.body2)),
          DataColumn(label: Text('Ratio Puntos', style: ComTextStyle.body2)),
          DataColumn(label: Text('2 a 0', style: ComTextStyle.body2)),
          DataColumn(label: Text('2 a 1', style: ComTextStyle.body2)),
          DataColumn(label: Text('1 a 2', style: ComTextStyle.body2)),
          DataColumn(label: Text('0 a 2', style: ComTextStyle.body2)),
        ],
        rows: matchData.asMap().entries.map((entry) {
          final index = entry.key;
          final data = entry.value;

          return DataRow(
            color: WidgetStateProperty.resolveWith(
              (states) => index.isEven ? Colors.grey.shade100 : null,
            ),
            cells: [
              DataCell(Text(data.position?.toString() ?? '-')),
              DataCell(Text(data.teamName)),
              DataCell(Text(data.stats.played.toString())),
              DataCell(Text(data.stats.won.toString())),
              DataCell(Text(data.stats.lost.toString())),
              DataCell(Text(data.stats.setsFor.toString())),
              DataCell(Text(data.stats.setsAgainst.toString())),
              DataCell(Text(data.stats.diffSets.toString())),
              DataCell(Text(data.stats.ratioSets.toStringAsFixed(2))),
              DataCell(Text(data.stats.totalPointsFor.toString())),
              DataCell(Text(data.stats.totalPointsAgainst.toString())),
              DataCell(Text(data.stats.diffPoints.toString())),
              DataCell(Text(data.stats.ratioPoints.toStringAsFixed(2))),
              DataCell(Text(data.stats.twoZero.toString())),
              DataCell(Text(data.stats.twoOne.toString())),
              DataCell(Text(data.stats.oneTwo.toString())),
              DataCell(Text(data.stats.zeroTwo.toString())),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// Estilo de texto constante
