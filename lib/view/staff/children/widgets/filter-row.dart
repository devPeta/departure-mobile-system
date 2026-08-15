import 'package:daycare_management_system_mobile/view/parent/history/widget/filter-button.dart';
import 'package:daycare_management_system_mobile/view/staff/children/staff-children-controller.dart';
import 'package:daycare_management_system_mobile/view/staff/children/widgets/filter-button.dart';
import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({
    required this.controller,
  });

  final StaffChildrenController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterButtonA(
            title: 'All',
            count: controller.totalPupils,
            selected:
            controller.selectedFilter.value ==
                'All',
            onTap: () =>
                controller.selectFilter('All'),
          ),

          const SizedBox(width: 8),

          FilterButtonA(
            title: 'Present',
            count: controller.presentCount,
            selected:
            controller.selectedFilter.value ==
                'Present',
            onTap: () =>
                controller.selectFilter(
                  'Present',
                ),
          ),

          const SizedBox(width: 8),

          FilterButtonA(
            title: 'Departed',
            count: controller.departedCount,
            selected:
            controller.selectedFilter.value ==
                'Departed',
            onTap: () =>
                controller.selectFilter(
                  'Departed',
                ),
          ),

          const SizedBox(width: 8),

          FilterButtonA(
            title: 'Pending',
            count: controller.pendingPickupCount,
            selected:
            controller.selectedFilter.value ==
                'Pending Pickup',
            onTap: () =>
                controller.selectFilter(
                  'Pending Pickup',
                ),
          ),
        ],
      ),
    );
  }
}