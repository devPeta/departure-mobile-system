import 'package:flutter/material.dart';

class DispatchHeader extends StatelessWidget {
  const DispatchHeader({
    required this.onViewAll,
  });

  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Live Dispatch Feed',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xff102A43),
          ),
        ),

        const Spacer(),

        GestureDetector(
          onTap: onViewAll,
          child: const Text(
            'View All',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xff8B5DE8),
            ),
          ),
        ),
      ],
    );
  }
}