import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminSettingsController extends GetxController {
  // ==========================================
  // GENERAL PARAMETERS
  // ==========================================

  final daycareNameController =
  TextEditingController(
    text: 'Sunshine Valley Daycare Center',
  );

  final operationalHoursController =
  TextEditingController(
    text: '07:00 AM - 06:30 PM',
  );

  // ==========================================
  // SECURITY PROTOCOLS
  // ==========================================

  final qrExpirySeconds = 60.obs;

  final enforceBiometricLogin = true.obs;

  // ==========================================
  // GLOBAL DISPATCH NOTIFICATIONS
  // ==========================================

  final parentPushAlerts = true.obs;

  // ==========================================
  // ADMINISTRATIVE BACKUPS
  // ==========================================

  final backupInterval = 'Every Night'.obs;

  // ==========================================
  // UPDATE SETTINGS
  // ==========================================

  void updateQrExpiry(int seconds) {
    qrExpirySeconds.value = seconds;
  }

  void toggleBiometric(bool value) {
    enforceBiometricLogin.value = value;
  }

  void toggleParentPushAlerts(bool value) {
    parentPushAlerts.value = value;
  }

  void selectBackupInterval(String interval) {
    backupInterval.value = interval;
  }

  // ==========================================
  // COMMIT CHANGES
  // ==========================================

  Future<void> commitChanges() async {
    final daycareName =
    daycareNameController.text.trim();

    final operationalHours =
    operationalHoursController.text.trim();

    if (daycareName.isEmpty ||
        operationalHours.isEmpty) {
      Get.snackbar(
        'Incomplete Settings',
        'Please complete the required fields.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: const Color(0xff102A43),
      );

      return;
    }

    // TODO:
    // Save settings to Firebase/API/database.

    Get.snackbar(
      'Changes Saved',
      'System configuration has been updated successfully.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xffD5F8EA),
      colorText: const Color(0xff102A43),
    );
  }

  @override
  void onClose() {
    daycareNameController.dispose();
    operationalHoursController.dispose();
    super.onClose();
  }
}