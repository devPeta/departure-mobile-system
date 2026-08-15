import 'package:daycare_management_system_mobile/view/staff/verification/staff-verification-controller.dart';
import 'package:daycare_management_system_mobile/view/staff/verification/widgets/circle-button.dart';
import 'package:daycare_management_system_mobile/view/staff/verification/widgets/scanner-frame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffVerification extends StatelessWidget {
  StaffVerification({super.key});

  final StaffVerificationController controller =
  Get.put(StaffVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff102A43),

      body: SafeArea(
        child: Column(
          children: [
            // ==========================================
            // HEADER
            // ==========================================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () {
                      Get.back();
                    },
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        'Departure Verification',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  CircleButton(
                    icon: Icons.flashlight_on_outlined,
                    onTap: () {
                      // Flashlight will be connected
                      // to mobile_scanner later.
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ==========================================
            // SCANNER
            // ==========================================

            const ScannerFrame(),

            const SizedBox(height: 32),

            // ==========================================
            // TITLE
            // ==========================================

            const Text(
              'Scan Guardian QR Code',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            // ==========================================
            // DESCRIPTION
            // ==========================================

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 28,
              ),
              child: Text(
                'SafeDepart matches this signature with certified records '
                    'to allow secure exit clearance.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  height: 1.45,
                  color: Color(0xffB9C6D2),
                ),
              ),
            ),

            const SizedBox(height: 34),

            // ==========================================
            // MANUAL CODE
            // ==========================================

            GestureDetector(
              onTap: controller.enterCodeManually,
              child: Column(
                children: [
                  const Text(
                    'Enter Code Manually',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff16C79A),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Container(
                    width: 132,
                    height: 1,
                    color: const Color(0xff16C79A),
                  ),
                ],
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}