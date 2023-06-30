import 'package:alquranapps/controller/kumpulan_doa_controller.dart';
import 'package:alquranapps/model/kumpulan_doa.dart';
import 'package:alquranapps/utils/mycolors.dart';
import 'package:alquranapps/utils/mytext.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class IsiKumpulanDoa extends StatelessWidget {
  IsiKumpulanDoa({super.key});
  final KumpulanDoa KP = Get.arguments;
  KumpulanDoaController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${KP.doa}"),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${KP.ayat}",
                    style: MyText().ayatAlQuran,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "${KP.latin}",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "${KP.artinya}",
                    style: MyText().artiAyatAlQuran,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
