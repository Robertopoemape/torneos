class PlayerData {
  final String teamId;
  final String documentType;
  final String documentNumber;
  final String name;
  final String lastName;
  final String nickName;
  final String shirtNumber;
  final String positionPlayer;
  final String imageUrl;
  final DateTime createDate;
  final DateTime modifiedDate;

  PlayerData({
    required this.teamId,
    required this.documentType,
    required this.documentNumber,
    required this.name,
    required this.lastName,
    required this.nickName,
    required this.shirtNumber,
    required this.positionPlayer,
    required this.imageUrl,
    required this.createDate,
    required this.modifiedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'teamId': teamId,
      'documentType': documentType,
      'documentNumber': documentNumber,
      'name': name,
      'lastName': lastName,
      'shirtNumber': shirtNumber,
      'nickName': nickName,
      'positionPlayer': positionPlayer,
      'imageUrl': imageUrl,
      'createDate': createDate.toIso8601String(),
      'modifiedDate': modifiedDate.toIso8601String(),
    };
  }

  factory PlayerData.fromMap(Map<String, dynamic> json) {
    return PlayerData(
      teamId: json['teamId'],
      documentType: json['documentType'],
      documentNumber: json['documentNumber'],
      name: json['name'],
      lastName: json['lastName'],
      shirtNumber: json['shirtNumber'],
      nickName: json['nickName'],
      positionPlayer: json['positionPlayer'],
      imageUrl: json['imageUrl'],
      createDate: DateTime.parse(json['createDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
    );
  }
}
