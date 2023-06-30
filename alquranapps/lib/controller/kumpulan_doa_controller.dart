import 'dart:convert';
import 'package:get/get.dart';
import 'package:alquranapps/model/kumpulan_doa.dart';
import 'package:http/http.dart' as http;

class KumpulanDoaController extends GetxController {
  Future<List<KumpulanDoa>> getAllDoa() async {
    Uri url = Uri.parse("https://doa-doa-api-ahmadramadhan.fly.dev/api");
    var res = await http.get(url);

    List? data = (json.decode(res.body));

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => KumpulanDoa.fromJson(e)).toList();
    }
  }
}
