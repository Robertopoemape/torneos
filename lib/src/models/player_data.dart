class PlayerData {
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

  factory PlayerData.fromMap(Map<String, dynamic> map) {
    return PlayerData(
      documentType: map['documentType'],
      documentNumber: map['documentNumber'],
      name: map['name'],
      lastName: map['lastName'],
      shirtNumber: map['shirtNumber'],
      nickName: map['nickName'],
      positionPlayer: map['positionPlayer'],
      imageUrl: map['imageUrl'],
      createDate: DateTime.parse(map['createDate']),
      modifiedDate: DateTime.parse(map['modifiedDate']),
    );
  }
}
