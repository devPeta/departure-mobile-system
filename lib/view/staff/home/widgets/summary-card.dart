import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    required this.value,
    required this.title,
    required this.subtitle,
    required this.valueColor,
  });

  final String value;
  final String title;
  final String subtitle;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xffDCE3EA),
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: valueColor,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff202B36),
            ),
          ),

          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xff7D8995),
            ),
          ),
        ],
      ),
    );
  }
}