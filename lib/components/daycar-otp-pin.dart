import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';


class OtpInput extends StatelessWidget {
  const OtpInput({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 56,

      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xff10243E),
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffD8E0E8),
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xff102A43),
          width: 1.5,
        ),
      ),
    );

    return Pinput(
      controller: controller,
      length: 6,

      keyboardType: TextInputType.number,

      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,

      // Removes the cursor from the boxes.
      showCursor: true,

      // Automatically hides the keyboard when
      // all 6 digits have been entered.
      onCompleted: (value) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}