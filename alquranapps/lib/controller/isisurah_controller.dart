import 'dart:convert';
import 'package:alquranapps/model/isi_surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class IsiSurahController extends GetxController {
  Future<IsiSurah> getIsiSurah(String id) async {
    Uri url = Uri.parse("https://quranapi.idn.sch.id/surah/$id");
    var res = await http.get(url);

    Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>);
    var test = IsiSurah.fromJson(data);
    print(test);

    return IsiSurah.fromJson(data);
  }
}
