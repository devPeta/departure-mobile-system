import 'package:flutter/material.dart';

class AppSnackbar {
  // 1. Define a global key to access ScaffoldMessenger without context
  static final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void success(String message) {
    _showSnackbar(
      message: message,
      title: 'Success',
      backgroundColor: Colors.green.shade600,
      icon: Icons.gpp_good,
    );
  }

  static void error(String message) {
    _showSnackbar(
      message: message,
      title: 'Error',
      backgroundColor: Colors.redAccent,
      icon: Icons.cancel_outlined,
    );
  }

  static void _showSnackbar({
    required String message,
    required String title,
    required Color backgroundColor,
    required IconData icon,
  }) {
    if (messengerKey.currentState == null) {
      print("DEBUG: ScaffoldMessengerState is NULL! Key is not registered in main.dart");
      return;
    }

    messengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 3),
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  Text(message, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}