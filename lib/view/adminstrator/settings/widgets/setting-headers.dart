import 'package:flutter/material.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                'GLOBAL SETTINGS',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff52667A),
                ),
              ),

              SizedBox(height: 3),

              Text(
                'System Config',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff102A43),
                ),
              ),

              SizedBox(height: 2),

              Text(
                'Core security & server behavior',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff66717E),
                ),
              ),
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.only(
            top: 2,
            right: 16,
          ),
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
        ),
      ],
    );
  }
}