import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPageView extends StatelessWidget {
  final String title;
  final String subtitle;

  const OnboardingPageView({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.08),

          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 26.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Text(
              subtitle,
              style: GoogleFonts.roboto(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}