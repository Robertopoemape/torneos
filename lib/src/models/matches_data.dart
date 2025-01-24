class MatchesData {
  final String tournamentId;
  final String dateStart;
  final String hour;
  final String teamLocal;
  final String teamVisitante;

  MatchesData({
    required this.tournamentId,
    required this.dateStart,
    required this.hour,
    required this.teamLocal,
    required this.teamVisitante,
  });

  factory MatchesData.fromJson(Map<String, dynamic> json) {
    return MatchesData(
      tournamentId: json['tournamentId'],
      dateStart: json['dateStart'],
      hour: json['hour'],
      teamLocal: json['teamLocal'],
      teamVisitante: json['teamVisitante'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'tournamentId': tournamentId,
      'dateStart': dateStart,
      'hour': hour,
      'teamLocal': teamLocal,
      'teamVisitante': teamVisitante,
    };
  }
}
