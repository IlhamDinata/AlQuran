// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:alquranapps/model/isi_surah.dart';
import 'package:alquranapps/model/surat.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://quranapi.idn.sch.id/surah");
  var res = await http.get(url);

  var data = (json.decode(res.body) as Map<String, dynamic>)["data"];

  //114 surah -> index 0-113 = 113 yaitu surat terakhir An Naas
  // print(data[113]["name"]);

  // data dari API ( raw data ) -> model ( yang sudah disiapkan )
  Surah surahAnNaas = Surah.fromJson(data[113]);

  //print(surahAnNaas.toJson());

  Uri urlAnNaas =
      Uri.parse("https://quranapi.idn.sch.id/surah/${surahAnNaas.number}");
  var resAnNaas = await http.get(urlAnNaas);

  Map<String, dynamic> dataAnNaas =
      (json.decode(resAnNaas.body) as Map<String, dynamic>);

  IsiSurah annas = IsiSurah.fromJson(dataAnNaas);

  print(annas.ayahs![0].audio);
}
