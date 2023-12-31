import 'package:alquranapps/model/surat.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://quranapi.idn.sch.id/surah");
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }

    //  Surah surahAnNaas = Surah.fromJson(data[113]);
  }
}
