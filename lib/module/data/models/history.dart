// To parse this JSON data, do
//
//     final history = historyFromJson(jsonString);

import 'dart:convert';

History historyFromJson(String str) => History.fromJson(json.decode(str));

String historyToJson(History data) => json.encode(data.toJson());

class History {
  String? id;
  String? idUser;
  String? type;
  String? date;
  String? total;
  String? detail;
  String? createdAt;
  String? updatedAt;

  History({
    this.id,
    this.idUser,
    this.type,
    this.date,
    this.total,
    this.detail,
    this.createdAt,
    this.updatedAt,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        idUser: json["idUser"],
        type: json["type"],
        date: json["date"],
        total: json["total"],
        detail: json["detail"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idUser": idUser,
        "type": type,
        "date": date,
        "total": total,
        "detail": detail,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
