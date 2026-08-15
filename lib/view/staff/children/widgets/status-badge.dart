import 'package:daycare_management_system_mobile/view/staff/children/public-model.dart';
import 'package:flutter/material.dart';

class StatusBadgeA extends StatelessWidget {
  const StatusBadgeA({
    required this.status,
  });

  final PupilStatus status;

  @override
  Widget build(BuildContext context) {
    late String text;
    late Color background;
    late Color foreground;

    switch (status) {
      case PupilStatus.present:
        text = 'Present';
        background = const Color(0xffD5F8EA);
        foreground = const Color(0xff20B486);
        break;

      case PupilStatus.departed:
        text = 'Departed';
        background = const Color(0xffE5EBF1);
        foreground = const Color(0xff52667A);
        break;

      case PupilStatus.pendingPickup:
        text = 'Pending Pickup';
        background = const Color(0xffFFF0C7);
        foreground = const Color(0xffD99A12);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius:
        BorderRadius.circular(14),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w600,
          color: foreground,
        ),
      ),
    );
  }
}