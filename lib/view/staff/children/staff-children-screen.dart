import 'package:daycare_management_system_mobile/view/parent/history/widget/search-field.dart';
import 'package:daycare_management_system_mobile/view/staff/children/staff-children-controller.dart';
import 'package:daycare_management_system_mobile/view/staff/children/widgets/empty-state.dart';
import 'package:daycare_management_system_mobile/view/staff/children/widgets/filter-row.dart';
import 'package:daycare_management_system_mobile/view/staff/children/widgets/header.dart';
import 'package:daycare_management_system_mobile/view/staff/children/widgets/public-card.dart';
import 'package:daycare_management_system_mobile/view/staff/children/widgets/search-textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class StaffChildren extends StatelessWidget {
  StaffChildren({super.key});

  final StaffChildrenController controller =
  Get.put(StaffChildrenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
         16
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              // ==========================================
              // HEADER
              // ==========================================

              Header(),

              const SizedBox(height: 16),

              // ==========================================
              // SEARCH
              // ==========================================

              TSearchField(
                controller: controller,
              ),

              const SizedBox(height: 14),

              // ==========================================
              // FILTERS
              // ==========================================

              Obx(
                    () => FilterRow(
                  controller: controller,
                ),
              ),

              const SizedBox(height: 16),

              // ==========================================
              // PUPIL LIST
              // ==========================================

              Obx(
                    () {
                  if (controller
                      .filteredPupils.isEmpty) {
                    return const EmptyState();
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics:
                    const NeverScrollableScrollPhysics(),
                    itemCount: controller
                        .filteredPupils.length,
                    separatorBuilder:
                        (_, __) =>
                    const SizedBox(height: 10),
                    itemBuilder:
                        (context, index) {
                      final pupil = controller
                          .filteredPupils[index];

                      return PupilCard(
                        pupil: pupil,
                        onTap: () {
                          controller
                              .openPupil(pupil);
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}