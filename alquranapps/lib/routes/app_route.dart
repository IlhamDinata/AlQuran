import 'package:alquranapps/Screen/home_page.dart';
import 'package:alquranapps/Screen/isi_kumpulandoa.dart';
import 'package:alquranapps/Screen/isisurah_page.dart';
import 'package:alquranapps/Screen/kumpulan_doa.dart';
import 'package:alquranapps/introduction.dart';
import 'package:alquranapps/routes/app_pages.dart';
import 'package:get/get.dart';

class AppRoute {
  static const initial = AppPages.introduction;
  static final pages = [
    GetPage(name: PagesPath.introduction, page: () => IntroductionPage()),
    GetPage(name: PagesPath.homepage, page: () => HomePage()),
    GetPage(name: PagesPath.isisurahpage, page: () => IsiSurahPage()),
    GetPage(name: PagesPath.kumpulandoa, page: () => KumpulanDoaPage()),
    GetPage(name: PagesPath.isikumpulandoa, page: () => IsiKumpulanDoa()),
  ];
}
