import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class yaksTextStyles {


  ///AppBar Text
  static final TextStyle yaksHeader = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      fontFamily: 'Inter',
      color: Color(0xFF1F2124),
      fontWeight: FontWeight.w600,
      height: 1.2,
      letterSpacing: 0.1,
    ),
  );
  static final TextStyle barberBody = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      fontFamily: 'Inter',
      color: Color(0xFF1F2124),
      fontWeight: FontWeight.w400,
      letterSpacing: 0.2,
    ),
  );

  ///OnBoarding Constant
  static final TextStyle yaksTitle = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 20,
      fontFamily: 'Inter',
      color: Color(0xFF1F2124),
    ),
  );

  static final TextStyle bodyBase = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontFamily: 'Inter',
      color: Color(0xFF1F2124),
    ),
  );

}