import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ParentProfileController extends GetxController {
  // ==========================================
  // PROFILE
  // ==========================================

  final parentName = 'Sarah Miller'.obs;

  final email = 'sarah.m@gmail.com'.obs;

  final phoneNumber = '(555) 019-2834'.obs;

  final profileImage = Rxn<File>();

  // ==========================================
  // SECURITY SETTINGS
  // ==========================================

  final biometricLogin = true.obs;

  final twoFactorSms = false.obs;

  // ==========================================
  // NOTIFICATION SETTINGS
  // ==========================================

  final pushNotifications = true.obs;

  final emailVerificationAlerts = true.obs;

  // ==========================================
  // IMAGE PICKER
  // ==========================================

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> changeProfilePhoto() async {
    try {
      final XFile? pickedImage =
      await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedImage != null) {
        profileImage.value = File(pickedImage.path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Unable to select photo',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // ==========================================
  // TOGGLES
  // ==========================================

  void toggleBiometric(bool value) {
    biometricLogin.value = value;
  }

  void toggleTwoFactor(bool value) {
    twoFactorSms.value = value;
  }

  void togglePushNotifications(bool value) {
    pushNotifications.value = value;
  }

  void toggleEmailAlerts(bool value) {
    emailVerificationAlerts.value = value;
  }

  // ==========================================
  // ACCOUNT ACTIONS
  // ==========================================

  void updateEmail() {
    Get.snackbar(
      'Email Settings',
      'Email settings selected.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void updatePhone() {
    Get.snackbar(
      'Phone Number',
      'Phone number settings selected.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void updatePassword() {
    // Navigate to change password screen later.
    Get.snackbar(
      'Update Password',
      'Password update selected.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}