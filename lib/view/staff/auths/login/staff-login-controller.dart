import 'package:daycare_management_system_mobile/view/auth-service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StaffLoginController extends GetxController {
  final AuthService _authService = AuthService();

  final emailController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  final isLoading = false.obs;

  Future<void> signIn() async {
    final email =
    emailController.text.trim();

    final password =
    passwordController.text.trim();

    if (email.isEmpty ||
        password.isEmpty) {
      _showError(
        'Required',
        'Please enter your email and password.',
      );
      return;
    }

    if (!GetUtils.isEmail(email)) {
      _showError(
        'Invalid Email',
        'Please enter a valid email address.',
      );
      return;
    }

    try {
      isLoading.value = true;

      final response =
      await _authService.signIn(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) {
        _showError(
          'Login Failed',
          'Invalid staff credentials.',
        );
        return;
      }

      // IMPORTANT:
      // Check that this account is actually staff
      final role =
      user.appMetadata['role'];

      if (role != 'staff') {
        await _authService.signOut();

        _showError(
          'Access Denied',
          'This account is not authorized as staff.',
        );

        return;
      }

      // Get.offAll(
      //       () => StaffHome(),
      // );
    } on AuthException catch (e) {
      _showError(
        'Login Failed',
        e.message,
      );
    } catch (e) {
      debugPrint(
        'Staff login error: $e',
      );

      _showError(
        'Error',
        'Something went wrong. Please try again.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  void _showError(
      String title,
      String message,
      ) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.redAccent,
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}