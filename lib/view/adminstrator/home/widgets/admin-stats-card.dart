import 'package:flutter/material.dart';

class AdminStatCard extends StatelessWidget {
  const AdminStatCard({
    required this.value,
    required this.title,
    required this.subtitle,
    this.valueColor =
    const Color(0xff102A43),
  });

  final int value;
  final String title;
  final String subtitle;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        12,
        10,
        12,
        8,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xffDCE3EA),
        ),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: valueColor,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xff182B3C),
            ),
          ),

          const SizedBox(height: 1),

          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 9,
              color: Color(0xff7A8794),
            ),
          ),
        ],
      ),
    );
  }
}