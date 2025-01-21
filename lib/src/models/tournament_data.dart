class TournamentData {
  final String tournamentId;
  final String nameTournament;
  final String imageUrl;
  final String description;
  final String location;
  final String stadium;
  final String startDate;
  final String endDate;
  final DateTime createDate;
  final DateTime modifiedDate;

  TournamentData({
    required this.tournamentId,
    required this.nameTournament,
    required this.imageUrl,
    required this.description,
    required this.location,
    required this.stadium,
    required this.startDate,
    required this.endDate,
    required this.createDate,
    required this.modifiedDate,
  });

  factory TournamentData.fromJson(Map<String, dynamic> json) {
    return TournamentData(
      tournamentId: json['tournamentId'],
      nameTournament: json['nameTournament'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      location: json['location'],
      stadium: json['stadium'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      createDate: DateTime.parse(json['createDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'tournamentId': tournamentId,
      'nameTournament': nameTournament,
      'imageUrl': imageUrl,
      'description': description,
      'location': location,
      'stadium': stadium,
      'startDate': startDate,
      'endDate': endDate,
      'createDate': createDate.toIso8601String(),
      'modifiedDate': modifiedDate.toIso8601String(),
    };
  }
}
