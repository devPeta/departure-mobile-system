import 'package:flutter/material.dart';

class AdminHeader extends StatelessWidget {
  const AdminHeader();

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
                'ADMIN OVERVIEW',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff52667A),
                ),
              ),

              SizedBox(height: 2),

              Text(
                'Chief Admin Portal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff102A43),
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Color(0xff102A43),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Text(
            'AD',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}