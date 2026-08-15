import 'package:daycare_management_system_mobile/view/parent/profile/profile-setting-controller.dart';
import 'package:daycare_management_system_mobile/view/parent/profile/widget/profile-header.dart';
import 'package:daycare_management_system_mobile/view/parent/profile/widget/profile-setting-tile.dart';
import 'package:daycare_management_system_mobile/view/parent/profile/widget/section-tile.dart';
import 'package:daycare_management_system_mobile/view/parent/profile/widget/setting-container.dart';
import 'package:daycare_management_system_mobile/view/parent/profile/widget/setting-divider.dart';
import 'package:daycare_management_system_mobile/view/parent/profile/widget/switch-tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ParentProfile extends StatelessWidget {
  ParentProfile({super.key});

  final ParentProfileController controller =
  Get.put(ParentProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            8,
            8,
            8,
            30,
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              // ==========================================
              // PROFILE HEADER
              // ==========================================

              ProfileHeader(
                controller: controller,
              ),

              const SizedBox(height: 28),

              // ==========================================
              // ACCOUNT SETTINGS
              // ==========================================

              const SectionTitle(
                title: 'Account Settings',
              ),

              const SizedBox(height: 10),

              SettingsContainer(
                children: [
                  SettingTile(
                    title: 'Email Settings',
                    trailing: Obx(
                          () => Text(
                        controller.email.value,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xff66717E),
                        ),
                      ),
                    ),
                    onTap: controller.updateEmail,
                  ),

                  SettingDivider(),

                  SettingTile(
                    title: 'Phone Number',
                    trailing: Obx(
                          () => Text(
                        controller.phoneNumber.value,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xff66717E),
                        ),
                      ),
                    ),
                    onTap: controller.updatePhone,
                  ),

                  SettingDivider(),

                  SettingTile(
                    title: 'Update Password',
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      size: 22,
                      color: Color(0xff9AA7B5),
                    ),
                    onTap: controller.updatePassword,
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // ==========================================
              // SECURITY & AUTHENTICATION
              // ==========================================

              const SectionTitle(
                title: 'Security & Authentication',
              ),

              const SizedBox(height: 10),

              SettingsContainer(
                children: [
                  Obx(
                        () => SwitchTile(
                      title: 'Biometric Login (FaceID)',
                      value:
                      controller.biometricLogin.value,
                      onChanged:
                      controller.toggleBiometric,
                    ),
                  ),

                  SettingDivider(),

                  Obx(
                        () => SwitchTile(
                      title: 'Two-factor SMS Verification',
                      value:
                      controller.twoFactorSms.value,
                      onChanged:
                      controller.toggleTwoFactor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // ==========================================
              // NOTIFICATION PREFERENCES
              // ==========================================

              const SectionTitle(
                title: 'Notification Preferences',
              ),

              const SizedBox(height: 10),

              SettingsContainer(
                children: [
                  Obx(
                        () => SwitchTile(
                      title: 'Push Notifications',
                      value: controller
                          .pushNotifications.value,
                      onChanged: controller
                          .togglePushNotifications,
                    ),
                  ),

                  SettingDivider(),

                  Obx(
                        () => SwitchTile(
                      title:
                      'Email Verification Alerts',
                      value: controller
                          .emailVerificationAlerts.value,
                      onChanged:
                      controller.toggleEmailAlerts,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}