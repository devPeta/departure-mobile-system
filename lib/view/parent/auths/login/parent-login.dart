import 'package:daycare_management_system_mobile/components/daycar-textfield.dart';
import 'package:daycare_management_system_mobile/components/daycare-button.dart';
import 'package:daycare_management_system_mobile/components/daycare-logo.dart';
import 'package:daycare_management_system_mobile/view/parent/auths/login/parent-login-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ParentLogin extends StatelessWidget {
  ParentLogin({super.key});

  final ParentLoginController controller =
  Get.put(ParentLoginController());

  static const Color primaryColor = Color(0xff102A43);
  static const Color buttonColor = Color(0xff52667A);
  static const Color backgroundColor = Color(0xffF8FAFC);
  static const Color fieldBackground = Color(0xffF1F5F9);

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

                      SizedBox(height: 48.h),

                      Text(
                        'Welcome back',
                        style: GoogleFonts.inter(
                          color: primaryColor,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      Text(
                        'Sign in to continue to your parent account.',
                        style: GoogleFonts.inter(
                          color: const Color(0xff64748B),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),

                      SizedBox(height: 36.h),


                      _buildLabel('Email address'),

                      SizedBox(height: 8.h),

                      DayCareTextField(
                        hintText: 'Enter your email',
                        prefix: Icon(
                          Icons.email_outlined,
                          color: const Color(0xff64748B),
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
                          color: const Color(0xff64748B),
                          size: 20.sp,
                        ),
                        isPassword: true,
                        controller: controller.passwordController,
                      ),

                      SizedBox(height: 12.h),


                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // Add forgot password navigation here.
                          },
                          child: Text(
                            'Forgot password?',
                            style: GoogleFonts.inter(
                              color: primaryColor,
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

                      SizedBox(height: 32.h),

                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade300,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                            ),
                            child: Text(
                              'OR',
                              style: GoogleFonts.inter(
                                color: Colors.grey.shade500,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade300,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 28.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: GoogleFonts.inter(
                              color: const Color(0xff64748B),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          GestureDetector(
                            onTap: () {
                              context.go('/signup');
                            },
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.inter(
                                color: primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24.h),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.verified_user_outlined,
                            size: 14.sp,
                            color: const Color(0xff94A3B8),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            'Your information is securely protected',
                            style: GoogleFonts.inter(
                              color: const Color(0xff94A3B8),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
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