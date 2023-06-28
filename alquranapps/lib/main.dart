import 'package:alquranapps/routes/app_pages.dart';
import 'package:alquranapps/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AlQuran",
      initialRoute: AppPages.introduction,
      getPages: AppRoute.pages,
    ),
  );
}
