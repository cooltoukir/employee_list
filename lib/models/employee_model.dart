class EmployeeModel {
  final int? id;
  final String? email;
  final String? password;
  final String? name;
  final Role? role;
  final String? avatar;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  EmployeeModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    this.creationAt,
    this.updatedAt,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: roleValues.map[json["role"]]!,
        avatar: json["avatar"],
        creationAt: json["creationAt"] == null
            ? null
            : DateTime.parse(json["creationAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "role": roleValues.reverse[role],
        "avatar": avatar,
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

enum Role { ADMIN, CUSTOMER }

final roleValues = EnumValues({"admin": Role.ADMIN, "customer": Role.CUSTOMER});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
