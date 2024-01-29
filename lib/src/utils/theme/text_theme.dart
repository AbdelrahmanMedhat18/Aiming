
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newecommerce/src/constants/colors.dart';

class TTextTheme{

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 28,fontWeight: FontWeight.bold,color: tDarkColor),
      displayMedium:GoogleFonts.montserrat(fontSize:24 ,fontWeight: FontWeight.w700,color: tDarkColor,),
      displaySmall: GoogleFonts.poppins(fontSize:24 ,fontWeight: FontWeight.w700,color: tDarkColor,),
      headlineMedium: GoogleFonts.poppins(fontSize:16 ,fontWeight: FontWeight.w600,color: tDarkColor,),
    titleLarge: GoogleFonts.poppins(fontSize:14 ,fontWeight: FontWeight.w600,color: tDarkColor,),
    bodyLarge: GoogleFonts.poppins(fontSize:14 ,fontWeight: FontWeight.normal,color: tDarkColor,),
    bodyMedium: GoogleFonts.poppins(fontSize:14 ,fontWeight: FontWeight.normal,color: tDarkColor,),

    titleSmall: GoogleFonts.poppins(
        color: Colors.black54,
        fontSize: 24,
      ),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 28,fontWeight: FontWeight.bold,color: tWhiteColor),
    displayMedium:GoogleFonts.montserrat(fontSize:24 ,fontWeight: FontWeight.w700,color: tWhiteColor,),
    displaySmall: GoogleFonts.poppins(fontSize:24 ,fontWeight: FontWeight.w700,color: tWhiteColor,),
    headlineMedium: GoogleFonts.poppins(fontSize:16 ,fontWeight: FontWeight.w600,color: tWhiteColor,),
    titleLarge: GoogleFonts.poppins(fontSize:14 ,fontWeight: FontWeight.w600,color: tWhiteColor,),
    bodyLarge: GoogleFonts.poppins(fontSize:14 ,fontWeight: FontWeight.normal,color: tWhiteColor,),
    bodyMedium: GoogleFonts.poppins(fontSize:14 ,fontWeight: FontWeight.normal,color: tWhiteColor,),
    titleSmall: GoogleFonts.poppins(
      color: Colors.white60,
      fontSize: 24,
    ),
  );

}