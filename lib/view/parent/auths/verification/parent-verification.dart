import 'package:daycare_management_system_mobile/components/detail-verification-textfield.dart';
import 'package:daycare_management_system_mobile/view/parent/home/navigation/parent-navigation-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'parent-verification-controller.dart';

class ParentVerificationScreen extends StatelessWidget {
  ParentVerificationScreen({super.key});

  final ParentVerificationController controller =
  Get.put(ParentVerificationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


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

                  GestureDetector(
                    onTap: () {
                      Get.to(() => ParentBottomNavigation());
                    },
                    child: const Text(
                      'Step 3 of 3',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff52667A),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 30),


              const Text(
                'Security Identification',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff10243E),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Complete your profile setup for visual verification checks at Handover.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.35,
                  color: Color(0xff52667A),
                ),
              ),

              const SizedBox(height: 22),


              Center(
                child: Obx(
                      () {
                    final image =
                        controller.selectedIdImage.value;

                    return GestureDetector(
                      onTap: controller.pickIdPhoto,
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(
                                0xffEAF0F6,
                              ),
                              border: Border.all(
                                color: const Color(
                                  0xff102A43,
                                ),
                                width: 2,
                                style:
                                BorderStyle.solid,
                              ),
                            ),
                            child: image == null
                                ? const Icon(
                              Icons
                                  .add_a_photo_outlined,
                              size: 30,
                              color:
                              Color(0xff102A43),
                            )
                                : ClipOval(
                              child: Image.file(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            image == null
                                ? 'Upload ID Photo'
                                : 'Change ID Photo',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight:
                              FontWeight.w600,
                              color:
                              Color(0xff102A43),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // ==========================================
              // FORM
              // ==========================================

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      // ADDRESS
                      const Text(
                        'Residential Address',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff52667A),
                        ),
                      ),

                      const SizedBox(height: 7),

                      VerificationTextField(
                        controller:
                        controller.addressController,
                        hintText:
                        'e.g. 100 University Ave, Kaduna',
                        icon: Icons.location_on_outlined,
                      ),

                      const SizedBox(height: 14),

                      // RELATIONSHIP
                      const Text(
                        'Primary Relationship to Children',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff52667A),
                        ),
                      ),

                      const SizedBox(height: 7),

                      VerificationTextField(
                        controller: controller
                            .relationshipController,
                        hintText: 'Father',
                        icon: Icons.people_outline,
                      ),

                      const SizedBox(height: 14),

                      // EMERGENCY PHONE
                      const Text(
                        'Secondary Emergency Contact Phone',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff52667A),
                        ),
                      ),

                      const SizedBox(height: 7),

                      VerificationTextField(
                        controller: controller
                            .emergencyPhoneController,
                        hintText:
                        'Emergency backup phone',
                        icon: Icons.phone_outlined,
                        keyboardType:
                        TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .allow(
                            RegExp(r'[0-9+\-\s]'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // ==================================
                      // SECURITY INFORMATION
                      // ==================================

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xffE5EEF8,
                          ),
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons
                                  .security_outlined,
                              size: 18,
                              color:
                              Color(0xff102A43),
                            ),

                            const SizedBox(width: 9),

                            Expanded(
                              child: Text(
                                'Verification data is encrypted under AES-256 protocols.\n'
                                    'Staff members can inspect photos during pickup.',
                                style: TextStyle(
                                  fontSize: 11,
                                  height: 1.35,
                                  color: const Color(
                                    0xff52667A,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ==================================
                      // COMPLETE SETUP
                      // ==================================

                      Obx(
                            () => SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: controller
                                .isLoading.value
                                ? null
                                : controller
                                .completeSetup,
                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color(
                                0xff102A43,
                              ),
                              foregroundColor:
                              Colors.white,
                              disabledBackgroundColor:
                              const Color(
                                0xff102A43,
                              ).withOpacity(0.6),
                              elevation: 0,
                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                  16,
                                ),
                              ),
                            ),
                            child: controller
                                .isLoading.value
                                ? const SizedBox(
                              height: 22,
                              width: 22,
                              child:
                              CircularProgressIndicator(
                                strokeWidth: 2,
                                color:
                                Colors.white,
                              ),
                            )
                                : const Text(
                              'Complete Setup',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
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