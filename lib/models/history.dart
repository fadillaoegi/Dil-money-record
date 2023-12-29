// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? idUser;
  String? type;
  String? date;
  String? total;
  String? detail;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.idUser,
    this.type,
    this.date,
    this.total,
    this.detail,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        idUser: json["id_user"],
        type: json["type"],
        date: json["date"],
        total: json["total"],
        detail: json["detail"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "type": type,
        "date": date,
        "total": total,
        "detail": detail,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
