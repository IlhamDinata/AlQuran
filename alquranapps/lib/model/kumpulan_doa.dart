// To parse this JSON data, do
//
//     final kumpulanDoa = kumpulanDoaFromJson(jsonString);

// API url : https://doa-doa-api-ahmadramadhan.fly.dev/api

import 'dart:convert';

List<KumpulanDoa> kumpulanDoaFromJson(String str) => List<KumpulanDoa>.from(
    json.decode(str).map((x) => KumpulanDoa.fromJson(x)));

String kumpulanDoaToJson(List<KumpulanDoa> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KumpulanDoa {
  String? id;
  String? doa;
  String? ayat;
  String? latin;
  String? artinya;

  KumpulanDoa({
    required this.id,
    required this.doa,
    required this.ayat,
    required this.latin,
    required this.artinya,
  });

  factory KumpulanDoa.fromJson(Map<String, dynamic> json) => KumpulanDoa(
        id: json["id"],
        doa: json["doa"],
        ayat: json["ayat"],
        latin: json["latin"],
        artinya: json["artinya"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doa": doa,
        "ayat": ayat,
        "latin": latin,
        "artinya": artinya,
      };
}
