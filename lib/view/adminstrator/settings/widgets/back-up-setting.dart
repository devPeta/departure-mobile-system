import 'package:daycare_management_system_mobile/view/adminstrator/settings/admin-setting-controller.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/widgets/back-up-option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackupSettings extends StatelessWidget {
  const BackupSettings({
    required this.controller,
  });

  final AdminSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showBackupOptions(
          context,
          controller,
        );
      },
      child: Container(
        padding:
        const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xffDCE3EA),
          ),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Backup Interval',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight:
                      FontWeight.w700,
                      color:
                      Color(0xff182B3C),
                    ),
                  ),

                  SizedBox(height: 3),

                  Text(
                    'Encrypted records backup schedule',
                    style: TextStyle(
                      fontSize: 10,
                      color:
                      Color(0xff66717E),
                    ),
                  ),
                ],
              ),
            ),

            Obx(
                  () => Text(
                controller.backupInterval.value,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight:
                  FontWeight.w700,
                  color:
                  Color(0xff182B3C),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBackupOptions(
      BuildContext context,
      AdminSettingsController controller,
      ) {
    Get.bottomSheet(
      Container(
        padding:
        const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize:
          MainAxisSize.min,
          children: [
            const Text(
              'Backup Interval',
              style: TextStyle(
                fontSize: 17,
                fontWeight:
                FontWeight.w700,
                color:
                Color(0xff102A43),
              ),
            ),

            const SizedBox(height: 16),

            BackupOption(
              title: 'Every Night',
              controller: controller,
            ),

            BackupOption(
              title: 'Every 12 Hours',
              controller: controller,
            ),

            BackupOption(
              title: 'Every 6 Hours',
              controller: controller,
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}