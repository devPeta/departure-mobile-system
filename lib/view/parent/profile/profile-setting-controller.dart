import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ParentProfileController extends GetxController {
  final SupabaseClient _supabase = Supabase.instance.client;

  // ==========================================
  // PROFILE
  // ==========================================

  final parentName = ''.obs;
  final email = ''.obs;
  final phoneNumber = ''.obs;

  final profileImage = Rxn<File>();

  final isLoading = false.obs;

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

  @override
  void onInit() {
    super.onInit();
    fetchParentProfile();
  }

  // ==========================================
  // FETCH PARENT PROFILE
  // ==========================================

  Future<void> fetchParentProfile() async {
    try {
      isLoading.value = true;

      final user = _supabase.auth.currentUser;

      if (user == null) {
        return;
      }

      final metadata = user.userMetadata;

      parentName.value =
          metadata?['full_name'] ??
              '${metadata?['first_name'] ?? ''} ${metadata?['last_name'] ?? ''}'
                  .trim();

      email.value = user.email ?? '';

      phoneNumber.value = metadata?['phone'] ?? '';

      debugPrint('Parent Name: ${parentName.value}');
      debugPrint('Email: ${email.value}');
      debugPrint('Phone: ${phoneNumber.value}');
    } catch (e) {
      debugPrint('Fetch parent profile error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // ==========================================
  // IMAGE PICKER
  // ==========================================

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
    Get.snackbar(
      'Update Password',
      'Password update selected.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}



// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ParentProfileController extends GetxController {
//   // ==========================================
//   // PROFILE
//   // ==========================================
//
//   final parentName = 'Sarah Miller'.obs;
//
//   final email = 'sarah.m@gmail.com'.obs;
//
//   final phoneNumber = '(555) 019-2834'.obs;
//
//   final profileImage = Rxn<File>();
//
//   // ==========================================
//   // SECURITY SETTINGS
//   // ==========================================
//
//   final biometricLogin = true.obs;
//
//   final twoFactorSms = false.obs;
//
//   // ==========================================
//   // NOTIFICATION SETTINGS
//   // ==========================================
//
//   final pushNotifications = true.obs;
//
//   final emailVerificationAlerts = true.obs;
//
//   // ==========================================
//   // IMAGE PICKER
//   // ==========================================
//
//   final ImagePicker _imagePicker = ImagePicker();
//
//   Future<void> changeProfilePhoto() async {
//     try {
//       final XFile? pickedImage =
//       await _imagePicker.pickImage(
//         source: ImageSource.gallery,
//         imageQuality: 80,
//       );
//
//       if (pickedImage != null) {
//         profileImage.value = File(pickedImage.path);
//       }
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Unable to select photo',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }
//
//   // ==========================================
//   // TOGGLES
//   // ==========================================
//
//   void toggleBiometric(bool value) {
//     biometricLogin.value = value;
//   }
//
//   void toggleTwoFactor(bool value) {
//     twoFactorSms.value = value;
//   }
//
//   void togglePushNotifications(bool value) {
//     pushNotifications.value = value;
//   }
//
//   void toggleEmailAlerts(bool value) {
//     emailVerificationAlerts.value = value;
//   }
//
//   // ==========================================
//   // ACCOUNT ACTIONS
//   // ==========================================
//
//   void updateEmail() {
//     Get.snackbar(
//       'Email Settings',
//       'Email settings selected.',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   void updatePhone() {
//     Get.snackbar(
//       'Phone Number',
//       'Phone number settings selected.',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   void updatePassword() {
//     // Navigate to change password screen later.
//     Get.snackbar(
//       'Update Password',
//       'Password update selected.',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
// }