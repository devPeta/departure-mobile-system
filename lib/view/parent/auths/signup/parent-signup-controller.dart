import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentSignupController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;

  Future<void> signUp() async {
    if (fullNameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      Get.snackbar(
        'Required',
        'Please complete all fields.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (!GetUtils.isEmail(emailController.text.trim())) {
      Get.snackbar(
        'Invalid Email',
        'Please enter a valid email address.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (passwordController.text.trim().length < 6) {
      Get.snackbar(
        'Weak Password',
        'Password must be at least 6 characters.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      Get.snackbar(
        'Password Mismatch',
        'Passwords do not match.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true;

      // TODO: Connect to your backend/API here.
      await Future.delayed(const Duration(seconds: 2));

      debugPrint('Full Name: ${fullNameController.text.trim()}');
      debugPrint('Email: ${emailController.text.trim()}');
      debugPrint('Phone: ${phoneController.text.trim()}');
      debugPrint('Password: ${passwordController.text.trim()}');

      Get.snackbar(
        'Success',
        'Parent account details submitted successfully.',
        snackPosition: SnackPosition.BOTTOM,
      );

      // TODO: Navigate to Step 3 after backend integration.
      // Get.toNamed('/parent-signup-step-3');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }
}