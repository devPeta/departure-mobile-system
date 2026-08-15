import 'package:daycare_management_system_mobile/components/daycar-otp-pin.dart';
import 'package:daycare_management_system_mobile/view/parent/auths/otp/parent-otp-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ParentOtpScreen extends StatelessWidget {
  ParentOtpScreen({
    super.key,
    required this.email,
  });

  final String email;

  final ParentOtpController controller =
  Get.put(ParentOtpController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==========================================
              // TOP BAR
              // ==========================================

              const SizedBox(height: 20),

              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: Color(0xff52667A),
                    ),
                  ),

                  const Spacer(),

                  const Text(
                    'Step 2 of 3',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff52667A),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 38),

              Text(
                'Security Pin Code',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff10243E),
                ),
              ),

              const SizedBox(height: 8),

              // ==========================================
              // DESCRIPTION
              // ==========================================

              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.sp,
                    height: 1.4,
                    color: const Color(0xff52667A),
                  ),
                  children: [
                    const TextSpan(
                      text:
                      'We sent a verification code to ',
                    ),

                    TextSpan(
                      text: email,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xff10243E),
                      ),
                    ),

                    const TextSpan(
                      text:
                      '\nto ensure secure account verification.',
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.05),

              // ==========================================
              // OTP INPUT
              // ==========================================

              OtpInput(
                controller: controller.otpController,
              ),

              const SizedBox(height: 28),

              // ==========================================
              // RESEND TEXT
              // ==========================================

              const Center(
                child: Text(
                  "Didn't receive the code?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff52667A),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ==========================================
              // COUNTDOWN / RESEND
              // ==========================================

              Obx(
                    () {
                  if (controller.canResend.value) {
                    return Center(
                      child: GestureDetector(
                        onTap: controller.resendOtp,
                        child: const Text(
                          'Resend Code',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            decoration:
                            TextDecoration.underline,
                            color: Color(0xff102A43),
                          ),
                        ),
                      ),
                    );
                  }

                  return Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 18,
                          color: Color(0xff8A99A8),
                        ),

                        const SizedBox(width: 4),

                        const Text(
                          'Resend in ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff52667A),
                          ),
                        ),

                        Text(
                          controller.formattedTime,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff52667A),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 32),

              // ==========================================
              // VERIFY BUTTON
              // ==========================================

              Obx(
                    () => SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xff102A43),
                      foregroundColor: Colors.white,
                      disabledBackgroundColor:
                      const Color(0xff102A43)
                          .withOpacity(0.6),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(16),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const SizedBox(
                      height: 22,
                      width: 22,
                      child:
                      CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                        : const Text(
                      'Verify & Confirm',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // ==========================================
              // VOICE VERIFICATION
              // ==========================================

              Center(
                child: GestureDetector(
                  onTap: () {
                    // TODO: Voice verification
                  },
                  child: const Text(
                    'Request Voice Verification',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      decoration:
                      TextDecoration.underline,
                      color: Color(0xff102A43),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}