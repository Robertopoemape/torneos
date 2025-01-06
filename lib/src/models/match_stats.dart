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

  Map<String, dynamic> toMap() {
    return {
      'played': played,
      'won': won,
      'lost': lost,
      'setsFor': setsFor,
      'setsAgainst': setsAgainst,
      'diffSets': diffSets,
      'ratioSets': ratioSets,
      'totalPointsFor': totalPointsFor,
      'totalPointsAgainst': totalPointsAgainst,
      'diffPoints': diffPoints,
      'ratioPoints': ratioPoints,
      'twoZero': twoZero,
      'twoOne': twoOne,
      'oneTwo': oneTwo,
      'zeroTwo': zeroTwo,
    };
  }

  factory MatchStats.fromMap(Map<String, dynamic> map) {
    return MatchStats(
      played: map['played'],
      won: map['won'],
      lost: map['lost'],
      setsFor: map['setsFor'],
      setsAgainst: map['setsAgainst'],
      diffSets: map['diffSets'],
      ratioSets: map['ratioSets'],
      totalPointsFor: map['totalPointsFor'],
      totalPointsAgainst: map['totalPointsAgainst'],
      diffPoints: map['diffPoints'],
      ratioPoints: map['ratioPoints'],
      twoZero: map['twoZero'],
      twoOne: map['twoOne'],
      oneTwo: map['oneTwo'],
      zeroTwo: map['zeroTwo'],
    );
  }
}
