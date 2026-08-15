import 'package:daycare_management_system_mobile/view/parent/notification/parent-notification-model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ParentNotificationController extends GetxController {
  final notifications = <ParentNotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    loadNotifications();
  }

  void loadNotifications() {
    notifications.assignAll([
      ParentNotificationModel(
        title: 'Security Alert',
        message:
        'New login session detected from Chrome browser on macOS.',
        time: '5 minutes ago',
        icon: Icons.shield_outlined,
        iconColor: const Color(0xffEF5350),
        iconBackground: const Color(0xffFDE8E8),
        isUnread: true,
      ),

      ParentNotificationModel(
        title: 'Departure Confirmed',
        message:
        'Maya Miller has been verified and picked up by Father (Jordan Miller).',
        time: '1 hour ago',
        icon: Icons.check_circle_outline_rounded,
        iconColor: const Color(0xff20B486),
        iconBackground: const Color(0xffDDF8EC),
      ),

      ParentNotificationModel(
        title: 'Pickup Request Pending',
        message:
        'Authorization requested for Leo Miller pickup by Sarah Miller.',
        time: '2 hours ago',
        icon: Icons.access_time_rounded,
        iconColor: const Color(0xff102A43),
        iconBackground: const Color(0xffE5EDF5),
      ),

      ParentNotificationModel(
        title: 'New Guardian Approved',
        message:
        'Elena Miller (Grandmother) has been vetted and cryptographic profile initialized.',
        time: 'Yesterday',
        icon: Icons.people_outline_rounded,
        iconColor: const Color(0xff20B486),
        iconBackground: const Color(0xffDDF8EC),
      ),
    ]);
  }

  // ==========================================
  // MARK SINGLE NOTIFICATION AS READ
  // ==========================================

  void markAsRead(int index) {
    final notification = notifications[index];

    notifications[index] = notification.copyWith(
      isUnread: false,
    );
  }

  // ==========================================
  // MARK ALL AS READ
  // ==========================================

  void markAllAsRead() {
    notifications.value = notifications
        .map(
          (notification) =>
          notification.copyWith(isUnread: false),
    )
        .toList();
  }

  // ==========================================
  // CHECK UNREAD NOTIFICATIONS
  // ==========================================

  int get unreadCount {
    return notifications
        .where((notification) => notification.isUnread)
        .length;
  }
}