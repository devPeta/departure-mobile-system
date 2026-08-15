import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ParentVerificationController extends GetxController {
  // ==============================
  // FORM CONTROLLERS
  // ==============================

  final addressController = TextEditingController();
  final relationshipController = TextEditingController();
  final emergencyPhoneController = TextEditingController();

  // ==============================
  // ID IMAGE
  // ==============================

  final selectedIdImage = Rxn<File>();

  final ImagePicker _picker = ImagePicker();

  // ==============================
  // LOADING
  // ==============================

  final isLoading = false.obs;

  // ==============================
  // PICK ID PHOTO
  // ==============================

  Future<void> pickIdPhoto() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image != null) {
        selectedIdImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Unable to select ID photo.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // ==============================
  // TAKE ID PHOTO
  // ==============================

  Future<void> takeIdPhoto() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (image != null) {
        selectedIdImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Unable to take ID photo.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // ==============================
  // REMOVE ID PHOTO
  // ==============================

  void removeIdPhoto() {
    selectedIdImage.value = null;
  }

  // ==============================
  // VALIDATE FORM
  // ==============================

  bool validateForm() {
    if (selectedIdImage.value == null) {
      Get.snackbar(
        'ID Required',
        'Please upload a photo of your identification.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    if (addressController.text.trim().isEmpty) {
      Get.snackbar(
        'Address Required',
        'Please enter your residential address.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    if (relationshipController.text.trim().isEmpty) {
      Get.snackbar(
        'Relationship Required',
        'Please enter your relationship to the child.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    if (emergencyPhoneController.text.trim().isEmpty) {
      Get.snackbar(
        'Emergency Contact Required',
        'Please enter an emergency contact number.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }

    return true;
  }

  // ==============================
  // COMPLETE SETUP
  // ==============================

  Future<void> completeSetup() async {
    if (!validateForm()) return;

    try {
      isLoading.value = true;

      final address = addressController.text.trim();
      final relationship =
      relationshipController.text.trim();
      final emergencyPhone =
      emergencyPhoneController.text.trim();

      final idImage = selectedIdImage.value;

      debugPrint('Address: $address');
      debugPrint('Relationship: $relationship');
      debugPrint('Emergency Phone: $emergencyPhone');
      debugPrint('ID Image: ${idImage?.path}');

      // TODO:
      // Upload the ID image and profile information
      // to your backend/API here.

      await Future.delayed(
        const Duration(seconds: 2),
      );

      // After successful registration:
      //
      // Get.offAllNamed('/parent-dashboard');

      Get.snackbar(
        'Success',
        'Your profile has been completed successfully.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Unable to complete your profile setup.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    addressController.dispose();
    relationshipController.dispose();
    emergencyPhoneController.dispose();

    super.onClose();
  }
}