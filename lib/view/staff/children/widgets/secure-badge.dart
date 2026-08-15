import 'package:flutter/material.dart';

class SecureBadge extends StatelessWidget {
  const SecureBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffD5F8EA),
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: const Text(
        'SECURE',
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: Color(0xff20B486),
        ),
      ),
    );
  }
}