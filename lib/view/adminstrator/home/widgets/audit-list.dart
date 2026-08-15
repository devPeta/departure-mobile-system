
import 'package:daycare_management_system_mobile/view/adminstrator/home/admin-home-page-controller.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/home/widgets/audit-card.dart';
import 'package:flutter/material.dart';

class AuditList extends StatelessWidget {
  const AuditList({
    required this.controller,
  });

  final AdminHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuditCard(
          icon: Icons.security_outlined,
          iconColor: const Color(0xff20B486),
          text:
          'Backup completed successfully • 03:00 AM',
        ),

        const SizedBox(height: 8),

        AuditCard(
          icon: Icons.lock_outline_rounded,
          iconColor: const Color(0xff8B5CF6),
          text:
          'System keys updated by Administrator • Yesterday',
        ),
      ],
    );
  }
}