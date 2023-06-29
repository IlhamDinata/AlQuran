import 'dart:convert';
import 'package:alquranapps/model/isi_surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

class IsiSurahController extends GetxController {
  final player = AudioPlayer();

  Future<IsiSurah> getIsiSurah(String id) async {
    Uri url = Uri.parse("https://quranapi.idn.sch.id/surah/$id");
    var res = await http.get(url);

    Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>);
    var test = IsiSurah.fromJson(data);
    print(test);

    return IsiSurah.fromJson(data);
  }

  void playAyahAudio(String url) async {
    if (url != null) {
      try {
        await player.setUrl(url);
        await player.play();
        await player.stop();
      } on PlayerException catch (e) {
        Get.defaultDialog(
          title: "Error",
          middleText: e.message.toString(),
        );
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
          title: "Error",
          middleText: "Connection aborted: ${e.message}",
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Error",
          middleText: "Cant Play Audio",
        );
      }

      // player.playbackEventStream.listen((event) {},
      //     onError: (Object e, StackTrace st) {
      //   if (e is PlayerException) {
      //     print('Error code: ${e.code}');
      //     print('Error message: ${e.message}');
      //   } else {
      //     print('An error occurred: $e');
      //   }
      // });
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: "Audio Not Found",
      );
    }
  }

  @override
  void onClose() async {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
