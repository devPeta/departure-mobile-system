import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentOtpController extends GetxController {
  final otpController = TextEditingController();

  final isLoading = false.obs;
  final secondsRemaining = 59.obs;
  final canResend = false.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();

    secondsRemaining.value = 59;
    canResend.value = false;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (secondsRemaining.value > 0) {
          secondsRemaining.value--;
        } else {
          canResend.value = true;
          timer.cancel();
        }
      },
    );
  }

  String get formattedTime {
    final minutes = secondsRemaining.value ~/ 60;
    final seconds = secondsRemaining.value % 60;

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  Future<void> verifyOtp() async {
    final otp = otpController.text.trim();

    if (otp.length != 6) {
      Get.snackbar(
        'Invalid Code',
        'Please enter the 6-digit verification code.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true;

      // TODO:
      // Connect your OTP verification API here.

      await Future.delayed(
        const Duration(seconds: 2),
      );

      debugPrint('OTP: $otp');

      // After successful verification:
      // Get.offAllNamed('/parent-dashboard');

    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendOtp() async {
    if (!canResend.value) return;

    try {
      // TODO:
      // Call your resend OTP API here.

      Get.snackbar(
        'Code Sent',
        'A new verification code has been sent.',
        snackPosition: SnackPosition.BOTTOM,
      );

      startTimer();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Unable to resend verification code.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpController.dispose();
    super.onClose();
  }
}