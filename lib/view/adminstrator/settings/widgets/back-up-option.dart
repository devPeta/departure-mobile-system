import 'package:daycare_management_system_mobile/view/adminstrator/settings/admin-setting-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackupOption
    extends StatelessWidget {
  const BackupOption({
    required this.title,
    required this.controller,
  });

  final String title;
  final AdminSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),

        trailing: controller
            .backupInterval.value ==
            title
            ? const Icon(
          Icons.check_circle,
          color:
          Color(0xff20B486),
        )
            : null,

        onTap: () {
          controller
              .selectBackupInterval(title);

          Get.back();
        },
      ),
    );
  }
}