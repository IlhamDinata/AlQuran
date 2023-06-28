import 'package:alquranapps/routes/app_pages.dart';
import 'package:alquranapps/utils/mytext.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Al Quran Apps",
              style: MyText().introductionText,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Lorem Ipsum Text Lorem Ipsum",
                style: MyText().subIntroductionText,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 350,
              width: 350,
              child: Lottie.asset("assets/animasidepan.json"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                Get.offAllNamed(AppPages.homepage);
              },
              child: Text("Get Started", style: MyText().primaryText),
            ),
          ],
        ),
      ),
    );
  }
}
