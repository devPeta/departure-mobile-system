import 'package:flutter/material.dart';

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              color: Color(0xffE8EEF5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications_none_rounded,
              size: 32,
              color: Color(0xff52667A),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'No notifications',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff10243E),
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'You are all caught up.',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff52667A),
            ),
          ),
        ],
      ),
    );
  }
}