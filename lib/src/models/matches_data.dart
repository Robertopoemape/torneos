class MatchesData {
  final String tournamentId;
  final String dateStart;
  final String hour;
  final String teamLocal;
  final String teamVisitant;

  MatchesData({
    required this.tournamentId,
    required this.dateStart,
    required this.hour,
    required this.teamLocal,
    required this.teamVisitant,
  });

  factory MatchesData.fromJson(Map<String, dynamic> json) {
    return MatchesData(
      tournamentId: json['tournamentId'],
      dateStart: json['dateStart'],
      hour: json['hour'],
      teamLocal: json['teamLocal'],
      teamVisitant: json['teamVisitant'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'tournamentId': tournamentId,
      'dateStart': dateStart,
      'hour': hour,
      'teamLocal': teamLocal,
      'teamVisitant': teamVisitant,
    };
  }
}
