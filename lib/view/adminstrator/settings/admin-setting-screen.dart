import 'package:daycare_management_system_mobile/view/adminstrator/settings/admin-setting-controller.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/widgets/back-up-setting.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/widgets/commit-button.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/widgets/general-parameter.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/widgets/notification-settings.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/widgets/section-tile.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/widgets/security-protocols.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/widgets/setting-headers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AdminSettings extends StatelessWidget {
  AdminSettings({super.key});

  final AdminSettingsController controller =
  Get.put(AdminSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              // ==========================================
              // HEADER
              // ==========================================

              const SettingsHeader(),

              const SizedBox(height: 20),

              // ==========================================
              // GENERAL PARAMETERS
              // ==========================================

              const SectionTitle(
                title: 'GENERAL PARAMETERS',
              ),

              const SizedBox(height: 8),

              GeneralParameters(
                controller: controller,
              ),

              const SizedBox(height: 18),

              // ==========================================
              // SECURITY PROTOCOLS
              // ==========================================

              const SectionTitle(
                title: 'SECURITY PROTOCOLS',
              ),

              const SizedBox(height: 8),

              SecurityProtocols(
                controller: controller,
              ),

              const SizedBox(height: 18),

              // ==========================================
              // GLOBAL DISPATCH NOTIFICATIONS
              // ==========================================

              const SectionTitle(
                title:
                'GLOBAL DISPATCH NOTIFICATIONS',
              ),

              const SizedBox(height: 8),

              NotificationSettings(
                controller: controller,
              ),

              const SizedBox(height: 18),

              // ==========================================
              // ADMINISTRATIVE BACKUPS
              // ==========================================

              const SectionTitle(
                title:
                'ADMINISTRATIVE BACKUPS',
              ),

              const SizedBox(height: 8),

              BackupSettings(
                controller: controller,
              ),

              const SizedBox(height: 18),

              // ==========================================
              // COMMIT CHANGES
              // ==========================================

              CommitButton(
                onPressed:
                controller.commitChanges,
              ),
            ],
          ),
        ),
      ),
    );
  }
}