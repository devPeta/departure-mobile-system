import 'package:daycare_management_system_mobile/view/adminstrator/settings/admin-setting-controller.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/widgets/switch-setting.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/widgets/value-badge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SecurityProtocols
    extends StatelessWidget {
  const SecurityProtocols({
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
          // QR EXPIRY
          Padding(
            padding:
            const EdgeInsets.fromLTRB(
              14,
              12,
              14,
              10,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        'QR Expiry Frame',
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
                        'Rotate parent clearance codes every 60 seconds',
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
                      () => ValueBadge(
                    value:
                    '${controller.qrExpirySeconds.value}s',
                  ),
                ),
              ],
            ),
          ),

          const Divider(
            height: 1,
            indent: 14,
            endIndent: 14,
          ),

          // BIOMETRIC LOGIN
          Obx(
                () => SwitchSetting(
              title:
              'Enforce Biometric Login',
              subtitle:
              'Require Face ID for all guard scans',
              value: controller
                  .enforceBiometricLogin
                  .value,
              onChanged:
              controller.toggleBiometric,
            ),
          ),
        ],
      ),
    );
  }
}