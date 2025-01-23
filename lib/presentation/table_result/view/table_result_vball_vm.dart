import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../core/style/app_text_style.dart';
import '../../../src/models/models.dart';

class TableResultVoleyVm extends ChangeNotifier {
  TableResultVoleyVm() {
    iniState();
  }

  void iniState() async {
    fetchMatches();
  }

  List<VolleyballMatch> _matches = [];
  bool _isLoading = true;
  String? _error;

  List<VolleyballMatch> get matches => _matches;
  bool get isLoading => _isLoading;
  String? get error => _error;

  List<Map<String, dynamic>> get rowData {
    return _matches.expand((match) {
      return [
        _buildRow(match, isLocal: true),
        _buildRow(match, isLocal: false),
      ];
    }).toList();
  }

  List<GridColumn> get gridColumns {
    const columnHeaders = [
      {'name': 'Fecha', 'width': 80.0},
      {'name': 'Equipo', 'width': 150.0},
      {'name': 'S1', 'width': 40.0},
      {'name': 'S2', 'width': 40.0},
      {'name': 'S3', 'width': 40.0},
      {'name': 'S4', 'width': 40.0},
      {'name': 'S5', 'width': 40.0},
      {'name': 'Resultado', 'width': 85.0},
      {'name': 'Puntaje', 'width': 85.0},
      {'name': 'Puntos', 'width': 85.0},
    ];

    return columnHeaders.map((header) {
      final name = header['name'] as String;
      final width = header['width'] as double;

      return GridColumn(
        columnName: name,
        width: width,
        label: Center(
          child: Text(
            name,
            style: ComTextStyle.body2.w900.sec500,
          ),
        ),
      );
    }).toList();
  }

  Future<void> fetchMatches() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final snapshot = await FirebaseFirestore.instance
          .collection('volleyball_matches')
          .get();
      _matches = snapshot.docs.map((doc) {
        return VolleyballMatch.fromJson(
          doc.data(),
          doc.id,
        );
      }).toList();
    } catch (e) {
      _error = "Error al cargar datos: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Map<String, dynamic> _buildRow(VolleyballMatch match,
      {required bool isLocal}) {
    final teamDetails =
        isLocal ? match.localTeamDetails : match.visitantTeamDetails;

    return {
      'fecha': match.createDate.toLocal().toString().split(' ')[0],
      'equipo': isLocal ? match.nameLocal : match.nameVisitant,
      's1': teamDetails.s1.toString(),
      's2': teamDetails.s2.toString(),
      's3': teamDetails.s3.toString(),
      's4': teamDetails.s4.toString(),
      's5': teamDetails.s5.toString(),
      'resultado': teamDetails.result.toString(),
      'puntaje': teamDetails.score.toString(),
      'puntos': teamDetails.point.toString(),
    };
  }
}
