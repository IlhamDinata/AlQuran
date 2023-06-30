import 'package:alquranapps/controller/kumpulan_doa_controller.dart';
import 'package:alquranapps/model/kumpulan_doa.dart';
import 'package:alquranapps/routes/app_pages.dart';
import 'package:alquranapps/utils/mycolors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class KumpulanDoaPage extends StatelessWidget {
  KumpulanDoaPage({super.key});
  KumpulanDoaController controller = Get.put(KumpulanDoaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColor.white,
      ),
      body: FutureBuilder<List<KumpulanDoa>>(
        future: controller.getAllDoa(),
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
              KumpulanDoa kumpulanDoa = snapshot.data![index];
              return ListTile(
                onTap: () {
                  Get.toNamed(AppPages.isikumpulandoa, arguments: kumpulanDoa);
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
    );
  }
}
