import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class YaksLogo extends StatelessWidget {
  final bool? showText;
  const YaksLogo({Key? key, this.showText = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        CircleAvatar(
          backgroundColor: Colors.black12,
          child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset('assets/images/logo.png'),
              )),
        ),
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
