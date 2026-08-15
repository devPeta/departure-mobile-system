import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayCareSocialButton extends StatelessWidget {
  final Color backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final String imgPaths;
  final String text;

  const DayCareSocialButton({
    Key? key,
    required this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    required this.imgPaths,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: borderColor != null && borderWidth != null
                ? Border.all(
              color: borderColor!,
              width: borderWidth!,
            )
                : null,
          ),
          child: Center(
            child: Image.asset(
              imgPaths,
              height: 16,
              width: 16,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: GoogleFonts.dmSans(
            color: const Color(0xff808080),
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),

      ],
    );
  }
}
