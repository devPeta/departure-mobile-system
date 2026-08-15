import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationTextField extends StatelessWidget {
  const VerificationTextField({
    required this.controller,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,

      style: const TextStyle(
        fontSize: 14,
        color: Color(0xff10243E),
      ),

      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xffA1ACB8),
        ),

        prefixIcon: Icon(
          icon,
          size: 20,
          color: const Color(0xff96A4B3),
        ),

        filled: true,
        fillColor: Colors.white,

        contentPadding:
        const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xffDCE3EA),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xff102A43),
            width: 1.3,
          ),
        ),
      ),
    );
  }
}