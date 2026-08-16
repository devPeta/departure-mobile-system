import 'package:daycare_management_system_mobile/view/staff/navigation/staff-navigation-bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffLoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;

  Future<void> signIn() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Get.snackbar(
        'Required',
        'Please enter your email and password.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true;

      // TODO: Add Firebase authentication here.
      await Future.delayed(const Duration(seconds: 2));

      Get.to(StaffBottomNavigation());
      debugPrint('Email: ${emailController.text}');
      debugPrint('Password: ${passwordController.text}');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}