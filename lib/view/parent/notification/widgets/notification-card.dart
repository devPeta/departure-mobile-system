import 'package:daycare_management_system_mobile/view/parent/notification/parent-notification-model.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    required this.notification,
    required this.onTap,
  });

  final ParentNotificationModel notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 102,
        ),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),

          border: Border.all(
            color: notification.isUnread
                ? const Color(0xff102A43)
                : const Color(0xffDCE3EA),
            width: notification.isUnread ? 1.2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            // ==========================================
            // ICON
            // ==========================================

            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: notification.iconBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(
                notification.icon,
                size: 20,
                color: notification.iconColor,
              ),
            ),

            const SizedBox(width: 14),

            // ==========================================
            // CONTENT
            // ==========================================

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff10243E),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    notification.message,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.35,
                      color: Color(0xff52667A),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    notification.time,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xffA1ACB8),
                    ),
                  ),
                ],
              ),
            ),

            // ==========================================
            // UNREAD INDICATOR
            // ==========================================

            if (notification.isUnread)
              Container(
                margin: const EdgeInsets.only(
                  top: 3,
                  left: 8,
                ),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xffE34B4B),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}