import 'package:daycare_management_system_mobile/view/adminstrator/settings/admin-setting-controller.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/widgets/switch-setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationSettings
    extends StatelessWidget {
  const NotificationSettings({
    required this.controller,
  });

  final AdminSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffDCE3EA),
        ),
      ),
      child: Obx(
            () => SwitchSetting(
          title: 'Parent Push Alerts',
          subtitle:
          'Broadcast exit timestamp on scan',
          value:
          controller.parentPushAlerts.value,
          onChanged:
          controller.toggleParentPushAlerts,
        ),
      ),
    );
  }
}