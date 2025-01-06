import '../src.dart';

class MatchData {
  final int? position;
  final String teamName;
  final MatchStats stats;

  MatchData({
    required this.teamName,
    required this.stats,
    this.position,
  });
}
