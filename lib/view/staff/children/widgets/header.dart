import 'package:daycare_management_system_mobile/view/staff/children/widgets/secure-badge.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'STAFF PORTAL',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff52667A),
                ),
              ),
            ),

            SecureBadge(),
          ],
        ),

        SizedBox(height: 4),

        Text(
          'Registered Pupils',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xff102A43),
          ),
        ),

        SizedBox(height: 2),

        Text(
          'Campus Departure Enrollment Roster',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff66717E),
          ),
        ),
      ],
    );
  }
}