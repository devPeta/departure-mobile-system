import 'package:daycare_management_system_mobile/view/parent/profile/profile-setting-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    required this.controller,
  });

  final ParentProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),

        Center(
          child: Obx(
                () => GestureDetector(
              onTap: controller.changeProfilePhoto,
              child: Container(
                width: 82,
                height: 82,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffE3E7EA),
                ),
                child: ClipOval(
                  child: controller.profileImage.value !=
                      null
                      ? Image.file(
                    controller.profileImage.value!,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) {
                      return const Icon(
                        Icons.person,
                        size: 42,
                        color: Color(0xff66717E),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        Obx(
              () => Text(
            controller.parentName.value,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: Color(0xff102A43),
            ),
          ),
        ),

        const SizedBox(height: 4),

        GestureDetector(
          onTap: controller.changeProfilePhoto,
          child: const Text(
            'EDIT PROFILE PHOTO',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xff20B486),
            ),
          ),
        ),
      ],
    );
  }
}