class MatchStats {
  final int played;
  final int won;
  final int lost;
  final int setsFor;
  final int setsAgainst;
  final int diffSets;
  final double ratioSets;
  final int totalPointsFor;
  final int totalPointsAgainst;
  final int diffPoints;
  final double ratioPoints;
  final int twoZero;
  final int twoOne;
  final int oneTwo;
  final int zeroTwo;

  MatchStats({
    required this.played,
    required this.won,
    required this.lost,
    required this.setsFor,
    required this.setsAgainst,
    required this.diffSets,
    required this.ratioSets,
    required this.totalPointsFor,
    required this.totalPointsAgainst,
    required this.diffPoints,
    required this.ratioPoints,
    required this.twoZero,
    required this.twoOne,
    required this.oneTwo,
    required this.zeroTwo,
  });
}
