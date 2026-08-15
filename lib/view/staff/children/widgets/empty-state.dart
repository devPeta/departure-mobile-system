import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 50,
      ),
      child: const Column(
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 40,
            color: Color(0xff9AA7B5),
          ),

          SizedBox(height: 10),

          Text(
            'No pupils found',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff52606D),
            ),
          ),

          SizedBox(height: 4),

          Text(
            'Try another search or filter.',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff8996A3),
            ),
          ),
        ],
      ),
    );
  }
}