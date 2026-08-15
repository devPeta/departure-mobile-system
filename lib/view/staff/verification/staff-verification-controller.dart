import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffVerificationController extends GetxController {
  final isScanning = true.obs;
  final isProcessing = false.obs;

  final scannedCode = ''.obs;

  void handleQrCode(String code) {
    if (isProcessing.value) return;

    scannedCode.value = code;

    // Prevent multiple scans
    isProcessing.value = true;
    isScanning.value = false;

    debugPrint('Guardian QR Code: $code');

    // TODO:
    // Send the QR code to your backend/API
    // and verify the guardian.

    Get.snackbar(
      'QR Code Detected',
      'Verifying guardian information...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: const Color(0xff102A43),
    );
  }

  void resetScanner() {
    scannedCode.value = '';
    isProcessing.value = false;
    isScanning.value = true;
  }

  void enterCodeManually() {
    Get.dialog(
      AlertDialog(
        title: const Text('Enter Verification Code'),
        content: const TextField(
          decoration: InputDecoration(
            hintText: 'Enter guardian code',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();

              Get.snackbar(
                'Verification',
                'Code submitted for verification.',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: const Text('Verify'),
          ),
        ],
      ),
    );
  }
}