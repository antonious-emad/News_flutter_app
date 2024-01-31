import 'package:flutter/material.dart';
import 'package:fourth/shared/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
class TextStyles{
  static TextTheme lightTextTheme=TextTheme(
  bodyLarge:GoogleFonts.poppins (color: intro,fontSize: 22,fontWeight: FontWeight.w700),
  titleLarge: GoogleFonts.exo(color: onappbar,fontWeight: FontWeight.w400,fontSize: 22) ,
  titleMedium:GoogleFonts.poppins(color: onappbar,fontWeight: FontWeight.w700,fontSize: 24) ,
  titleSmall: GoogleFonts.exo(color: onappbar,fontWeight: FontWeight.w400,fontSize: 14) ,
  labelSmall:GoogleFonts.poppins(color: sourcetitleNewscolor,fontWeight: FontWeight.w400,fontSize: 10) ,
  labelMedium:GoogleFonts.inter(color:timeNewsColor,fontWeight: FontWeight.w400,fontSize: 13) ,
  labelLarge:GoogleFonts.poppins(color: titleNewscolor,fontWeight: FontWeight.w500,fontSize: 14) ,
  bodyMedium:GoogleFonts.poppins(color:titleNewscolor,fontWeight: FontWeight.w300,fontSize: 13) ,
  headlineMedium: GoogleFonts.poppins(color: blacked,fontSize: 14,fontWeight:FontWeight.w700 ),
  headlineSmall: GoogleFonts.inter(color: appbarcolor,fontSize: 14,fontWeight:FontWeight.w400 ),
  );
}