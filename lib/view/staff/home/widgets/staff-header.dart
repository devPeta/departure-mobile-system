import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../staff-homepage-controller.dart';

class StaffHeader extends StatelessWidget {
  const StaffHeader({
    required this.controller,
  });

  final StaffHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Obx(
                    () => Text(
                  controller.campusName.value,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff52667A),
                  ),
                ),
              ),

              const SizedBox(height: 3),

              Obx(
                    () => Text(
                  'Hi, ${controller.staffName.value}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff102A43),
                  ),
                ),
              ),
            ],
          ),
        ),

        Obx(
              () => Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffE8EEF5),
              borderRadius:
              BorderRadius.circular(20),
            ),
            child: Text(
              controller.staffRole.value,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Color(0xff52667A),
              ),
            ),
          ),
        ),
      ],
    );
  }
}