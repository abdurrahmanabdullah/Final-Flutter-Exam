// To parse this JSON data, do
//
//     final listDetailsModel = listDetailsModelFromJson(jsonString);

import 'dart:convert';

ListDetailsModel listDetailsModelFromJson(String str) =>
    ListDetailsModel.fromJson(json.decode(str));

String listDetailsModelToJson(ListDetailsModel data) =>
    json.encode(data.toJson());

class ListDetailsModel {
  int? statusCode;
  bool? success;
  Data? data;

  ListDetailsModel({
    this.statusCode,
    this.success,
    this.data,
  });

  factory ListDetailsModel.fromJson(Map<String, dynamic> json) =>
      ListDetailsModel(
        statusCode: json["status_code"],
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  String? name;
  String? uid;
  int? id;
  String? email;
  String? mobileNumber;
  String? address;
  DateTime? createAt;

  Data({
    this.name,
    this.uid,
    this.id,
    this.email,
    this.mobileNumber,
    this.address,
    this.createAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        uid: json["uid"],
        id: json["id"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        address: json["address"],
        createAt: json["create_at"] == null
            ? null
            : DateTime.parse(json["create_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "id": id,
        "email": email,
        "mobile_number": mobileNumber,
        "address": address,
        "create_at": createAt?.toIso8601String(),
      };
}
