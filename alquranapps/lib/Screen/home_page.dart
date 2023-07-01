import 'package:alquranapps/controller/home_controller.dart';
import 'package:alquranapps/controller/kumpulan_doa_controller.dart';
import 'package:alquranapps/model/kumpulan_doa.dart';
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
  KumpulanDoaController controllerDoa = Get.put(KumpulanDoaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Al-Quran"),
        titleTextStyle: MyText().primaryText,
        backgroundColor: MyColor.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamualaikum",
                style: MyText().primaryText,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 175,
                width: Get.width,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Opacity(
                        opacity: 0.9,
                        child: Container(
                          width: 175,
                          height: 175,
                          child: Image.asset(
                            "assets/quran.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [MyColor.primary, MyColor.secondary, MyColor.sec],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TabBar(
                indicatorColor: MyColor.primary,
                labelColor: MyColor.primary,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: "SURAH",
                    // child: Text(
                    //   "SURAH",
                    //   style: MyText().secondaryText,
                    // ),
                  ),
                  Tab(
                    text: "DOA",
                    // child: Text(
                    //   "DOA",
                    //   style: MyText().secondaryText,
                    // ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                      future: controller.getAllSurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                                Get.toNamed(AppPages.isisurahpage,
                                    arguments: surah);
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
                    FutureBuilder<List<KumpulanDoa>>(
                      future: controllerDoa.getAllDoa(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                            KumpulanDoa kumpulanDoa = snapshot.data![index];
                            return ListTile(
                              onTap: () {
                                Get.toNamed(AppPages.isikumpulandoa,
                                    arguments: kumpulanDoa);
                              },
                              leading: CircleAvatar(
                                backgroundColor: MyColor.primary,
                                child: Text("${kumpulanDoa.id}"),
                              ),
                              title: Text("${kumpulanDoa.doa}"),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
