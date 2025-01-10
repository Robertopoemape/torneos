import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/style/app_colors.dart';
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
        centerTitle: true,
        backgroundColor: ComColors.succ500,
        foregroundColor: ComColors.gsWhite,
        title: Text(
          'Tabla de Resultados',
          style: ComTextStyle.h6.gsWhite,
        ),
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

class MatchDataTable extends StatelessWidget {
  final List<MatchData> matchData;

  const MatchDataTable({super.key, required this.matchData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: WidgetStateProperty.resolveWith(
          (states) => ComColors.gs600,
        ),
        headingTextStyle: ComTextStyle.body2.copyWith(
          fontWeight: FontWeight.bold,
          color: ComColors.gsWhite,
        ),
        dataRowColor: WidgetStateProperty.resolveWith(
          (states) =>
              states.contains(WidgetState.selected) ? ComColors.inf500 : null,
        ),
        dataTextStyle: ComTextStyle.body2.copyWith(fontSize: 14),
        columnSpacing: 20,
        headingRowHeight: 40,
        horizontalMargin: 16,
        border: TableBorder.symmetric(
          inside: BorderSide(color: ComColors.gs300, width: 1),
        ),
        columns: [
          _buildColumn('Pos.'),
          _buildColumn('Equipo'),
          _buildColumn('PJ', isNumeric: true),
          _buildColumn('PG', isNumeric: true),
          _buildColumn('PP', isNumeric: true),
          _buildColumn('SF', isNumeric: true),
          _buildColumn('SC', isNumeric: true),
          _buildColumn('DFS', isNumeric: true),
          _buildColumn('Ratio Sets', isNumeric: true),
          _buildColumn('PTF', isNumeric: true),
          _buildColumn('PTC', isNumeric: true),
          _buildColumn('DFP', isNumeric: true),
          _buildColumn('Ratio Puntos', isNumeric: true),
          _buildColumn('2 a 0', isNumeric: true),
          _buildColumn('2 a 1', isNumeric: true),
          _buildColumn('1 a 2', isNumeric: true),
          _buildColumn('0 a 2', isNumeric: true),
        ],
        rows: matchData.asMap().entries.map((entry) {
          final index = entry.key;
          final data = entry.value;

          return DataRow(
            color: WidgetStateProperty.resolveWith(
              (states) => index.isEven ? ComColors.supp100 : null,
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

  DataColumn _buildColumn(String label, {bool isNumeric = false}) {
    return DataColumn(
      label: Text(label),
      numeric: isNumeric,
    );
  }
}
