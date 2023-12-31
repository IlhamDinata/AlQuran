import 'dart:ui';

import 'package:alquranapps/controller/isisurah_controller.dart';
import 'package:alquranapps/model/isi_surah.dart';
import 'package:alquranapps/model/surat.dart';
import 'package:alquranapps/utils/mycolors.dart';
import 'package:alquranapps/utils/mytext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class IsiSurahPage extends StatelessWidget {
  IsiSurahPage({super.key});
  final Surah surah = Get.arguments;
  IsiSurahController controller = Get.put(IsiSurahController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${surah.name ?? 'Empty'}"),
        titleTextStyle: MyText().titleText,
        centerTitle: true,
        backgroundColor: MyColor.primary,
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    "${surah.asma ?? 'Empty'}",
                    style: MyText().titleIsiText,
                  ),
                  Text(
                    "${surah.translationId} | ${surah.numberOfAyahs} Ayat | Diturunkan di ${surah.typeId}",
                    style: MyText().subTitleIsiText,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FutureBuilder<IsiSurah>(
            future: controller.getIsiSurah(surah.number.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: MyColor.primary,
                  ),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: Text("Tidak Ada Data"),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data?.ayahs?.length ?? 0,
                itemBuilder: (context, index) {
                  if (snapshot.data?.ayahs?.length == 0) {
                    return SizedBox();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: MyColor.primary,
                                child: Text("${index + 1}"),
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.playAyahAudio(
                                        "${snapshot.data!.ayahs![index].audio}");
                                  },
                                  icon: Icon(Icons.music_note)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${snapshot.data!.ayahs?[index].ayahText}",
                        style: MyText().ayatAlQuran,
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(height: 30),
                      Text(
                        "${snapshot.data!.ayahs?[index].readText}",
                        // style: MyText().artiAyatAlQuran,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${snapshot.data!.ayahs?[index].indoText}",
                        style: MyText().artiAyatAlQuran,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 50),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
