import 'package:alquranapps/utils/mycolors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class MyText {
  TextStyle introductionText = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 25,
  );

  TextStyle subIntroductionText = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 20,
  );

  TextStyle primaryText = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    color: MyColor.primary,
    fontSize: 18,
  );

  TextStyle titleText = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    color: MyColor.white,
    fontSize: 18,
  );

  TextStyle titleIsiText = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    color: MyColor.black,
    fontSize: 25,
  );

  TextStyle subTitleIsiText = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    color: MyColor.black,
    fontSize: 15,
  );

  TextStyle ayatAlQuran = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    color: MyColor.black,
    fontSize: 25,
  );
}
