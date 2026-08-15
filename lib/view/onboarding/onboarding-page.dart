import 'package:daycare_management_system_mobile/components/daycare-button.dart';
import 'package:daycare_management_system_mobile/const/daycareColors.dart';
import 'package:daycare_management_system_mobile/view/onboarding/onboarding-controller.dart';
import 'package:daycare_management_system_mobile/view/onboarding/widgets/pageview-content.dart';
import 'package:daycare_management_system_mobile/view/role/role-selection-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController onboardingController =
  Get.put(OnboardingController());

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/1.jfif',
      'title': 'Secure Release Verification',
      'subtitle':
      'Two-factor verification ensures children are only released to vetted guardians.',
    },
    {
      'image': 'assets/images/2.jfif',
      'title': 'Real-time Departure Logs',
      'subtitle':
      'Instant push notifications sent to parents the moment handover is completed.',
    },
    {
      'image': 'assets/images/3.jfif',
      'title': 'Digital Departure Records',
      'subtitle':
      'Authorized records securely maintained for administrative audit trails.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // BACKGROUND IMAGE
          Obx(
                () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: SizedBox.expand(
                key: ValueKey(
                  onboardingData[
                  onboardingController.currentPage.value]['image'],
                ),
                child: Image.asset(
                  onboardingData[
                  onboardingController.currentPage.value]['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // GRADIENT OVERLAY
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black87,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black87,
                ],
                stops: [
                  0.0,
                  0.35,
                  0.60,
                  1.0,
                ],
              ),
            ),
          ),

          // PAGE CONTENT
          PageView.builder(
            controller: onboardingController.pageController,
            itemCount: onboardingData.length,
            onPageChanged: onboardingController.goToPage,
            itemBuilder: (context, index) {
              final page = onboardingData[index];

              return OnboardingPageView(
                title: page['title']!,
                subtitle: page['subtitle']!,
              );
            },
          ),

          // BOTTOM CONTROLS
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // PAGE INDICATORS
                Obx(
                      () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                          (index) => buildIndicator(
                        index ==
                            onboardingController.currentPage.value,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // BUTTON
                Obx(
                      () => DayCareButton(
                    onPressed: () {
                      if (onboardingController.currentPage.value <
                          onboardingData.length - 1) {
                        onboardingController.nextPage();
                      } else {
                        Get.to(RoleSelectionScreen(),);
                      }
                    },
                    text: onboardingController.currentPage.value <
                        onboardingData.length - 1
                        ? 'Next'
                        : 'Get Started',
                    backgroundColor: const Color(0xff102A43),
                    textColor: Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.white
            : Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}