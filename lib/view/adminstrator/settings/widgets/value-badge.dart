import 'package:flutter/material.dart';

class ValueBadge extends StatelessWidget {
  const ValueBadge({
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffE8EEF5),
        borderRadius:
        BorderRadius.circular(8),
      ),
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Color(0xff334E68),
        ),
      ),
    );
  }
}