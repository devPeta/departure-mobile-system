import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DaycareLogo extends StatelessWidget {
  final bool? showText;
  const DaycareLogo({Key? key, this.showText = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
       Icon(Icons.book_online),
        SizedBox(width: 8,),
        if (showText!)
          Text(
            'D E P A R T U R E',
            style: GoogleFonts.inter(
              color: Color(0xff102A43),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
      ],
    );
  }
}
