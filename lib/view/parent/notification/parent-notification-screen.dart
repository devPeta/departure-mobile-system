import 'package:daycare_management_system_mobile/view/parent/notification/parent-notification-controller.dart';
import 'package:daycare_management_system_mobile/view/parent/notification/widgets/empty-notification.dart';
import 'package:daycare_management_system_mobile/view/parent/notification/widgets/notification-card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ParentNotificationsScreen extends StatelessWidget {
  ParentNotificationsScreen({super.key});

  final ParentNotificationController controller =
  Get.put(ParentNotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: Column(
            children: [
              // ==========================================
              // HEADER
              // ==========================================

              Padding(
                padding: const EdgeInsets.all(16
                ),
                child: Row(
                  children: [
                    const Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff10243E),
                      ),
                    ),

                    const Spacer(),

                    GestureDetector(
                      onTap: controller.markAllAsRead,
                      child: const Text(
                        'Mark All Read',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff102A43),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ==========================================
              // NOTIFICATIONS
              // ==========================================

              Expanded(
                child: Obx(
                      () {
                    if (controller.notifications.isEmpty) {
                      return const EmptyNotifications();
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      itemCount:
                      controller.notifications.length,
                      separatorBuilder: (_, __) =>
                      const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final notification =
                        controller.notifications[index];

                        return NotificationCard(
                          notification: notification,
                          onTap: () {
                            controller.markAsRead(index);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}