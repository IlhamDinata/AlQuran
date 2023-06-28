// To parse this JSON data, do
//
// final surah = surahFromJson(jsonString);

// API URL https://quranapi.idn.sch.id/surah
// Semua surah

import 'dart:convert';

Surah surahFromJson(String str) => Surah.fromJson(json.decode(str));

String surahToJson(Surah data) => json.encode(data.toJson());

class Surah {
  String? translationId;
  String? translationEn;
  String? asma;
  int? numberOfAyahs;
  String? name;
  int? number;
  String? typeId;
  String? typeEn;
  int? orderNumber;

  Surah({
    this.translationId,
    this.translationEn,
    this.asma,
    this.numberOfAyahs,
    this.name,
    this.number,
    this.typeId,
    this.typeEn,
    this.orderNumber,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        translationId: json["translationId"],
        translationEn: json["translationEn"],
        asma: json["asma"],
        numberOfAyahs: json["numberOfAyahs"],
        name: json["name"],
        number: json["number"],
        typeId: json["typeId"],
        typeEn: json["typeEn"],
        orderNumber: json["orderNumber"],
      );

  Map<String, dynamic> toJson() => {
        "translationId": translationId,
        "translationEn": translationEn,
        "asma": asma,
        "numberOfAyahs": numberOfAyahs,
        "name": name,
        "number": number,
        "typeId": typeId,
        "typeEn": typeEn,
        "orderNumber": orderNumber,
      };
}
