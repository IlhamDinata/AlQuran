import 'package:alquranapps/controller/home_controller.dart';
import 'package:alquranapps/model/surat.dart';
import 'package:alquranapps/routes/app_pages.dart';
import 'package:alquranapps/utils/mycolors.dart';
import 'package:alquranapps/utils/mytext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        titleTextStyle: MyText().primaryText,
        backgroundColor: MyColor.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<List<Surah>>(
        future: controller.getAllSurah(),
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
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Surah surah = snapshot.data![index];
              return ListTile(
                onTap: () {
                  Get.toNamed(AppPages.isisurahpage, arguments: surah);
                },
                leading: CircleAvatar(
                  backgroundColor: MyColor.primary,
                  child: Text("${surah.number}"),
                ),
                title: Text("${surah.name ?? 'Surah...'}"),
                subtitle: Text(
                    "${surah.translationId ?? 'Surah...'} | ${surah.numberOfAyahs ?? 'Empty'} Ayat"),
                trailing: Text("${surah.asma}"),
              );
            },
          );
        },
      ),
    );
  }
}
