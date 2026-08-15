import 'package:daycare_management_system_mobile/view/adminstrator/settings/admin-setting-controller.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/widgets/setting-textfield.dart';
import 'package:flutter/material.dart';

class GeneralParameters extends StatelessWidget {
  const GeneralParameters({
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
      child: Column(
        children: [
          SettingsTextField(
            label: 'Daycare Center Name',
            controller:
            controller.daycareNameController,
          ),

          const Divider(
            height: 1,
            indent: 14,
            endIndent: 14,
          ),

          SettingsTextField(
            label: 'Operational Hours',
            controller:
            controller.operationalHoursController,
          ),
        ],
      ),
    );
  }
}