import 'models.dart';

class MatchData {
  final String teamName;
  final int? position;
  final MatchStats stats;

  MatchData({
    required this.teamName,
    required this.stats,
    this.position,
  });

  Map<String, dynamic> toMap() {
    return {
      'teamName': teamName,
      'position': position,
      'stats': stats.toJson(),
    };
  }

  factory MatchData.fromMap(Map<String, dynamic> map) {
    return MatchData(
      teamName: map['teamName'],
      position: map['position'],
      stats: MatchStats.fromMap(map['stats']),
    );
  }
}
