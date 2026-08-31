import 'package:daycare_management_system_mobile/view/auth-service.dart';
import 'package:daycare_management_system_mobile/view/parent/auths/login/parent-binding-login.dart';
import 'package:daycare_management_system_mobile/view/parent/auths/login/parent-login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ParentSignupController extends GetxController {
  final AuthService _authService = AuthService();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;

  Future<void> signUp() async {
    final fullName =
    fullNameController.text.trim();

    final email =
    emailController.text.trim();

    final phone =
    phoneController.text.trim();

    final password =
    passwordController.text.trim();

    final confirmPassword =
    confirmPasswordController.text.trim();

    // -------------------------------
    // VALIDATION
    // -------------------------------

    if (fullName.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showError(
        'Required',
        'Please complete all fields.',
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

    if (password.length < 6) {
      _showError(
        'Weak Password',
        'Password must be at least 6 characters.',
      );
      return;
    }

    if (password != confirmPassword) {
      _showError(
        'Password Mismatch',
        'Passwords do not match.',
      );
      return;
    }

    // -------------------------------
    // NAME
    // -------------------------------

    final nameParts =
    fullName.split(RegExp(r'\s+'));

    if (nameParts.length < 2) {
      _showError(
        'Invalid Name',
        'Please enter your first and last name.',
      );
      return;
    }

    final firstName = nameParts.first;

    final lastName =
    nameParts.sublist(1).join(' ');

    // -------------------------------
    // SIGN UP
    // -------------------------------

    try {
      isLoading.value = true;

      final response =
      await _authService.signUpParent(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
      );

      if (response.user == null) {
        _showError(
          'Registration Failed',
          'Unable to create your account.',
        );
        return;
      }

      // Email confirmation enabled
      if (response.session == null) {
        Get.snackbar(
          'Account Created',
          'Please check your email and verify your account before signing in.',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 5),
        );

        Get.offAll(
              () => ParentLogin(),
              binding: ParentLoginBinding(),
        );

        return;
      }

      // Email confirmation disabled
      Get.snackbar(
        'Account Created',
        'Your parent account has been created successfully.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );

      Get.offAll(
            () => ParentLogin(),
            binding: ParentLoginBinding(),
      );
    } on AuthException catch (e) {
      _showError(
        'Registration Failed',
        e.message,
      );
    } catch (e) {
      debugPrint(
        'Parent signup error: $e',
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
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }
}