import '../src.dart';

class MatchData {
  final String teamName;
  final int? position;
  final MatchStats stats;

  MatchData({
    required this.teamName,
    this.position,
    required this.stats,
  });

  Map<String, dynamic> toMap() {
    return {
      'teamName': teamName,
      'position': position,
      'stats': stats.toMap(),
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
