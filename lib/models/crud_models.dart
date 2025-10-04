class CrudModels {
  String? apapun;
  int? id, angka;
  DateTime? createdAt, updatedAt;

  CrudModels({
    this.id,
    required this.apapun,
    required this.angka,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{'angka': angka, 'apapun': apapun};

    // if (data['id'] != null) {
    //   data['id'] = id;
    // }

    // if (data['createdAt'] != null) {
    //   data['createdAt'] = createdAt!.toIso8601String();
    // }

    // if (data['updatedAt'] != null) {
    //   data['updatedAt'] = updatedAt!.toIso8601String();
    // }
    return data;
  }

  factory CrudModels.fromJson(Map<String, dynamic> json) {
    return CrudModels(
      id: json['id'],
      apapun: json['apapun'],
      angka: json['angka'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}
