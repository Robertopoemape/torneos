class PlayerData {
  final String? documentType;
  final String documentNumber;
  final String name;
  final String lastName;
  final String shirtNumber;
  final DateTime createDate;
  final DateTime modifiedDate;

  PlayerData({
    this.documentType,
    required this.documentNumber,
    required this.name,
    required this.lastName,
    required this.shirtNumber,
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
      createDate: DateTime.parse(map['createDate']),
      modifiedDate: DateTime.parse(map['modifiedDate']),
    );
  }
}
