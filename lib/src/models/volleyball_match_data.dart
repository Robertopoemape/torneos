class VolleyballMatch {
  final String id;
  final String nameLocal;
  final String nameVisitant;
  final List<SetScore> sets;
  final TeamDetails localTeamDetails;
  final TeamDetails visitantTeamDetails;
  final DateTime date;

  VolleyballMatch({
    required this.id,
    required this.nameLocal,
    required this.nameVisitant,
    required this.sets,
    required this.localTeamDetails,
    required this.visitantTeamDetails,
    required this.date,
  });

  factory VolleyballMatch.fromJson(Map<String, dynamic> json, String id) {
    var setsFromJson =
        (json['sets'] as List).map((set) => SetScore.fromJson(set)).toList();
    return VolleyballMatch(
      id: id,
      nameLocal: json['nameLocal'],
      nameVisitant: json['nameVisitant'],
      sets: setsFromJson,
      localTeamDetails: TeamDetails.fromJson(json['team1_details']),
      visitantTeamDetails: TeamDetails.fromJson(json['team2_details']),
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameLocal': nameLocal,
      'nameVisitant': nameVisitant,
      'sets': sets.map((set) => set.toJson()).toList(),
      'localTeamDetails': localTeamDetails.toJson(),
      'visitantTeamDetails': visitantTeamDetails.toJson(),
      'date': date.toIso8601String(),
    };
  }
}

class SetScore {
  final int localteam;
  final int visitantTeam;

  SetScore({
    required this.localteam,
    required this.visitantTeam,
  });

  factory SetScore.fromJson(Map<String, dynamic> json) {
    return SetScore(
      localteam: json['localteam'],
      visitantTeam: json['visitantTeam'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'localteam': localteam,
      'visitantTeam': visitantTeam,
    };
  }

  SetScore copyWith({
    int? localteam,
    int? visitantTeam,
  }) {
    return SetScore(
      localteam: localteam ?? this.localteam,
      visitantTeam: visitantTeam ?? this.visitantTeam,
    );
  }
}

class TeamDetails {
  final int s1;
  final int s2;
  final int s3;
  final int s4;
  final int s5;
  final int result;
  final int score;
  final int point;

  TeamDetails({
    required this.s1,
    required this.s2,
    required this.s3,
    required this.s4,
    required this.s5,
    required this.result,
    required this.score,
    required this.point,
  });

  factory TeamDetails.fromJson(Map<String, dynamic> json) {
    return TeamDetails(
      s1: json['S1'],
      s2: json['S2'],
      s3: json['S3'],
      s4: json['S4'],
      s5: json['S5'],
      result: json['result'],
      score: json['score'],
      point: json['point'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'S1': s1,
      'S2': s2,
      'S3': s3,
      'S4': s4,
      'S5': s5,
      'result': result,
      'score': score,
      'point': point,
    };
  }
}
