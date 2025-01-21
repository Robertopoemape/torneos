class MatchesData {
  final String matchesId;
  final String tournamentId;
  final String date;
  final String hour;
  final String teamLocal;
  final String teamVisitante;

  MatchesData({
    required this.matchesId,
    required this.tournamentId,
    required this.date,
    required this.hour,
    required this.teamLocal,
    required this.teamVisitante,
  });

  factory MatchesData.fromJson(Map<String, dynamic> json) {
    return MatchesData(
      matchesId: json['matchesId'],
      tournamentId: json['tournamentId'],
      date: json['date'],
      hour: json['hour'],
      teamLocal: json['teamLocal'],
      teamVisitante: json['teamVisitante'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'matchesId': matchesId,
      'tournamentId': tournamentId,
      'date': date,
      'hour': hour,
      'teamLocal': teamLocal,
      'teamVisitante': teamVisitante,
    };
  }
}
