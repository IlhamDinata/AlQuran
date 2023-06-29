// To parse this JSON data, do
//
//     final isiSurah = isiSurahFromJson(jsonString);

import 'dart:convert';

IsiSurah isiSurahFromJson(String str) => IsiSurah.fromJson(json.decode(str));

String isiSurahToJson(IsiSurah data) => json.encode(data.toJson());

class IsiSurah {
  String? translationId;
  String? translationEn;
  String? asma;
  int? numberOfAyahs;
  String? name;
  int? number;
  String? typeId;
  String? typeEn;
  int? orderNumber;
  List<Ayah>? ayahs;

  IsiSurah({
    this.translationId,
    this.translationEn,
    this.asma,
    this.numberOfAyahs,
    this.name,
    this.number,
    this.typeId,
    this.typeEn,
    this.orderNumber,
    this.ayahs,
  });

  factory IsiSurah.fromJson(Map<String, dynamic> json) => IsiSurah(
        translationId: json["translationId"],
        translationEn: json["translationEn"],
        asma: json["asma"] == null ? [] : json["asma"],
        numberOfAyahs:
            json["numberOfAyahs"] == null ? [] : json["numberOfAyahs"],
        name: json["name"],
        number: json["number"],
        typeId: json["typeId"],
        typeEn: json["typeEn"],
        orderNumber: json["orderNumber"],
        ayahs: json["ayahs"] == null
            ? []
            : List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
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
        "ayahs": List<dynamic>.from(ayahs!.map((x) => x.toJson())),
      };
}

class Ayah {
  int? verseId;
  String? ayahText;
  String? indoText;
  String? enText;
  String? readText;
  String? audio;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  Ayah({
    this.verseId,
    this.ayahText,
    this.indoText,
    this.enText,
    this.readText,
    this.audio,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        verseId: json["verseId"],
        ayahText: json["ayahText"] == null ? [] : json["ayahText"],
        indoText: json["indoText"] == null ? [] : json["indoText"],
        enText: json["enText"],
        readText: json["readText"] == null ? [] : json["readText"],
        audio: json["audio"] == null ? [] : json["audio"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: json["sajda"],
      );

  Map<String, dynamic> toJson() => {
        "verseId": verseId,
        "ayahText": ayahText,
        "indoText": indoText,
        "enText": enText,
        "readText": readText,
        "audio": audio,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda,
      };
}
