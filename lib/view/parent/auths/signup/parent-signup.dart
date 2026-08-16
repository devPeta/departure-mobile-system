import 'package:flutter/material.dart';
import 'package:daycare_management_system_mobile/components/daycar-textfield.dart';
import 'package:daycare_management_system_mobile/components/daycare-button.dart';
import 'package:daycare_management_system_mobile/view/parent/auths/signup/parent-signup-controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ParentSignup extends StatelessWidget {
  ParentSignup({super.key});

  final ParentSignupController controller =
  Get.put(ParentSignupController());

  static const Color primaryColor = Color(0xff102A43);
  static const Color backgroundColor = Color(0xffF7F9FC);
  static const Color mutedTextColor = Color(0xff64748B);
  static const Color borderColor = Color(0xffCBD5E1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.symmetric(
                  horizontal: 22.w,
                  vertical: 18.h,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - 36.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              padding: EdgeInsets.all(6.w),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: const Color(0xff475569),
                                size: 18.sp,
                              ),
                            ),
                          ),
                          Text(
                            'Step 2 of 3',
                            style: GoogleFonts.inter(
                              color: const Color(0xff475569),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffE5EFF8),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.people_outline_rounded,
                              color: primaryColor,
                              size: 21.sp,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                'Selected Role: Parent / Guardian',
                                style: GoogleFonts.inter(
                                  color: primaryColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 26.h),

                      Text(
                        'Create Parent Profile',
                        style: GoogleFonts.inter(
                          color: const Color(0xff0F172A),
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),

                      SizedBox(height: 7.h),

                      Text(
                        'Input verified personal details matching your '
                            'admission record.',
                        style: GoogleFonts.inter(
                          color: mutedTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.45,
                        ),
                      ),

                      SizedBox(height: 24.h),

                      _buildLabel('Full Name'),

                      SizedBox(height: 7.h),

                      DayCareTextField(
                        hintText: 'e.g. Jordan Miller',
                        prefix: Icon(
                          Icons.person_outline_rounded,
                          color: const Color(0xff94A3B8),
                          size: 20.sp,
                        ),
                        controller: controller.fullNameController,
                      ),

                      SizedBox(height: 16.h),

                      _buildLabel('Email Address'),

                      SizedBox(height: 7.h),

                      DayCareTextField(
                        hintText: 'e.g. jordan@email.com',
                        prefix: Icon(
                          Icons.email_outlined,
                          color: const Color(0xff94A3B8),
                          size: 20.sp,
                        ),
                        controller: controller.emailController,
                      ),

                      SizedBox(height: 16.h),

                      _buildLabel('Verified Phone Number'),

                      SizedBox(height: 7.h),

                      DayCareTextField(
                        hintText: 'e.g. +1555-0199',
                        prefix: Icon(
                          Icons.phone_outlined,
                          color: const Color(0xff94A3B8),
                          size: 20.sp,
                        ),
                        controller: controller.phoneController,
                      ),

                      SizedBox(height: 16.h),

                      _buildLabel('Password'),

                      SizedBox(height: 7.h),

                      DayCareTextField(
                        hintText: 'Password',
                        prefix: Icon(
                          Icons.lock_outline_rounded,
                          color: const Color(0xff94A3B8),
                          size: 20.sp,
                        ),
                        isPassword: true,
                        controller: controller.passwordController,
                      ),

                      SizedBox(height: 16.h),

                      _buildLabel('Confirm Password'),

                      SizedBox(height: 7.h),

                      DayCareTextField(
                        hintText: 'Retype password',
                        prefix: Icon(
                          Icons.lock_outline_rounded,
                          color: const Color(0xff94A3B8),
                          size: 20.sp,
                        ),
                        isPassword: true,
                        controller:
                        controller.confirmPasswordController,
                      ),

                      SizedBox(height: 22.h),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.verified_user_outlined,
                            color: const Color(0xff159A75),
                            size: 17.sp,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              'SafeDepart cryptographically signs records '
                                  'to comply with FERPA laws.',
                              style: GoogleFonts.inter(
                                color: mutedTextColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 22.h),

                      Obx(
                            () {
                          final isLoading =
                              controller.isLoading.value;

                          return SizedBox(
                            width: double.infinity,
                            height: 54.h,
                            child: DayCareButton(
                              onPressed:
                              isLoading ? null : controller.signUp,
                              text: isLoading
                                  ? 'Creating account...'
                                  : 'Create Account',
                              backgroundColor: primaryColor,
                              textColor: Colors.white,
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 18.h),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: GoogleFonts.inter(
                                color: mutedTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            GestureDetector(
                              onTap: () {
                                Get.offNamed('/parent-login');
                              },
                              child: Text(
                                'Sign In',
                                style: GoogleFonts.inter(
                                  color: primaryColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 18.h),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: const Color(0xff334155),
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
