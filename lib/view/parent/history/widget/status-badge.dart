import 'package:flutter/material.dart';


class StatusBadge extends StatelessWidget {
  const StatusBadge({
    required this.status,
    required this.isVerified,
  });

  final String status;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: isVerified
            ? const Color(0xffD9F8EB)
            : const Color(0xffFDE2E2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: isVerified
              ? const Color(0xff20A878)
              : const Color(0xffE05252),
        ),
      ),
    );
  }
}