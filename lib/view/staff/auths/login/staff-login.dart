import 'package:daycare_management_system_mobile/components/daycar-textfield.dart';
import 'package:daycare_management_system_mobile/components/daycare-button.dart';
import 'package:daycare_management_system_mobile/components/daycare-logo.dart';
import 'package:daycare_management_system_mobile/view/staff/auths/login/staff-login-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffLogin extends StatelessWidget {
  StaffLogin({super.key});

  final StaffLoginController controller =
  Get.put(StaffLoginController());

  static const Color primaryColor = Color(0xff102A43);
  static const Color staffColor = Color(0xff1F4E5F);
  static const Color buttonColor = Color(0xff3E6473);
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
                  horizontal: 24.w,
                  vertical: 28.h,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - 56.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: const DaycareLogo(
                          showText: true,
                        ),
                      ),

                      SizedBox(height: 32.h),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 7.h,
                        ),
                        decoration: BoxDecoration(
                          color: staffColor.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: staffColor.withOpacity(0.15),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.badge_outlined,
                              size: 15.sp,
                              color: staffColor,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'STAFF PORTAL',
                              style: GoogleFonts.inter(
                                color: staffColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 18.h),

                      Text(
                        'Staff Login',
                        style: GoogleFonts.inter(
                          color: primaryColor,
                          fontSize: 27.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      Text(
                        'Sign in to manage your daycare duties '
                            'and access your staff account.',
                        style: GoogleFonts.inter(
                          color: mutedTextColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),

                      SizedBox(height: 34.h),

                      _buildLabel('Staff email'),

                      SizedBox(height: 8.h),

                      DayCareTextField(
                        hintText: 'Enter your staff email',
                        prefix: Icon(
                          Icons.email_outlined,
                          color: mutedTextColor,
                          size: 20.sp,
                        ),
                        controller: controller.emailController,
                      ),

                      SizedBox(height: 20.h),

                      _buildLabel('Password'),

                      SizedBox(height: 8.h),

                      DayCareTextField(
                        hintText: 'Enter your password',
                        prefix: Icon(
                          Icons.lock_outline_rounded,
                          color: mutedTextColor,
                          size: 20.sp,
                        ),
                        isPassword: true,
                        controller: controller.passwordController,
                      ),

                      SizedBox(height: 12.h),

                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot password?',
                            style: GoogleFonts.inter(
                              color: staffColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 28.h),

                      Obx(
                            () {
                          final isLoading =
                              controller.isLoading.value;

                          return SizedBox(
                            width: double.infinity,
                            height: 52.h,
                            child: DayCareButton(
                              onPressed:
                              isLoading ? null : controller.signIn,
                              text: isLoading
                                  ? 'Signing in...'
                                  : 'Sign in',
                              backgroundColor: buttonColor,
                              textColor: Colors.white,
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 28.h),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(12.r),
                          border: Border.all(
                            color: borderColor.withOpacity(0.7),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(7.w),
                              decoration: BoxDecoration(
                                color: staffColor.withOpacity(0.08),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.work_outline_rounded,
                                color: staffColor,
                                size: 16.sp,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Staff access',
                                    style: GoogleFonts.inter(
                                      color: primaryColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    'Use your registered staff credentials '
                                        'to access your assigned daycare functions.',
                                    style: GoogleFonts.inter(
                                      color: mutedTextColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 28.h),

                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.verified_user_outlined,
                              color: Colors.grey.shade500,
                              size: 14.sp,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'Secure staff authentication',
                              style: GoogleFonts.inter(
                                color: Colors.grey.shade500,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20.h),
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
        color: primaryColor,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}