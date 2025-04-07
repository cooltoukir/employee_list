// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeModel> employeeModelFromJson(String str) => List<EmployeeModel>.from(json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel {
  final int? id;
  final String? name;
  final int? age;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final String? occupation;
  final List<String>? hobbies;

  EmployeeModel({
    this.id,
    this.name,
    this.age,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.occupation,
    this.hobbies,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    id: json["id"],
    name: json["name"],
    age: json["age"],
    username: json["username"],
    email: json["email"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    phone: json["phone"],
    website: json["website"],
    occupation: json["occupation"],
    hobbies: json["hobbies"] == null ? [] : List<String>.from(json["hobbies"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "age": age,
    "username": username,
    "email": email,
    "address": address?.toJson(),
    "phone": phone,
    "website": website,
    "occupation": occupation,
    "hobbies": hobbies == null ? [] : List<dynamic>.from(hobbies!.map((x) => x)),
  };
}

class Address {
  final String? street;
  final City? city;
  final String? zip;

  Address({
    this.street,
    this.city,
    this.zip,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    city: cityValues.map[json["city"]]!,
    zip: json["zip"],
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "city": cityValues.reverse[city],
    "zip": zip,
  };
}

enum City {
  CITYVILLE,
  TOWNSVILLE,
  VILLAGELAND
}

final cityValues = EnumValues({
  "Cityville": City.CITYVILLE,
  "Townsville": City.TOWNSVILLE,
  "Villageland": City.VILLAGELAND
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
