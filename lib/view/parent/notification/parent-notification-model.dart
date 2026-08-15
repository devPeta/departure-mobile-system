import 'package:flutter/material.dart';

class ParentNotificationModel {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final bool isUnread;

  ParentNotificationModel({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    this.isUnread = false,
  });

  ParentNotificationModel copyWith({
    bool? isUnread,
  }) {
    return ParentNotificationModel(
      title: title,
      message: message,
      time: time,
      icon: icon,
      iconColor: iconColor,
      iconBackground: iconBackground,
      isUnread: isUnread ?? this.isUnread,
    );
  }
}