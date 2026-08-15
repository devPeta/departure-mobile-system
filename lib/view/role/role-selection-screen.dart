import 'package:daycare_management_system_mobile/view/role/dayRoleSelection.dart';
import 'package:daycare_management_system_mobile/view/role/widgets/selection-card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class RoleSelectionScreen extends StatelessWidget {
  RoleSelectionScreen({super.key});

  final RoleSelectionController controller =
  Get.put(RoleSelectionController());

  final List<Map<String, dynamic>> roles = [
    {
      'title': 'Parent / Guardian',
      'subtitle': 'Authorized family pickup contact',
      'icon': Icons.people_outline,
    },
    {
      'title': 'Daycare Staff',
      'subtitle': 'Teachers & reception verification specialists',
      'icon': Icons.assignment_outlined,
    },
    {
      'title': 'Administrator',
      'subtitle': 'System settings, database control & audits',
      'icon': Icons.settings_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // TOP BAR
              const SizedBox(height: 20),

              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: Color(0xff52667A),
                    ),
                  ),

                  const Spacer(),

                  const Text(
                    'Step 1 of 3',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff52667A),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // PROGRESS INDICATOR
              Center(
                child: Container(
                  width: 12,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // TITLE
              const Text(
                'Select Your Role',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff10243E),
                ),
              ),

              const SizedBox(height: 8),

              // DESCRIPTION
              const Text(
                'Please choose the clearance level required for your system workspace.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: Color(0xff52667A),
                ),
              ),

              const SizedBox(height: 30),

              // ROLE CARDS
              Expanded(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: roles.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final role = roles[index];

                    return Obx(
                          () => RoleSelectionCard(
                        title: role['title'],
                        subtitle: role['subtitle'],
                        icon: role['icon'],
                        isSelected:
                        controller.isSelected(index),
                        onTap: () {
                          controller.selectRole(index);
                        },
                      ),
                    );
                  },
                ),
              ),

              // CONTINUE BUTTON
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint(
                        'Selected: ${controller.selectedRoleName}',
                      );

                      // Navigate to Step 2
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff102A43),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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