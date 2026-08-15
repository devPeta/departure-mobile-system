import 'package:flutter/material.dart';
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color(0xff102A43),
      ),
    );
  }
}
