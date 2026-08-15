import 'package:daycare_management_system_mobile/view/staff/home/staff-homepage-controller.dart';
import 'package:daycare_management_system_mobile/view/staff/home/widgets/summary-card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryGrid extends StatelessWidget {
  const SummaryGrid({
    required this.controller,
  });

  final StaffHomeController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics:
      const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.65,
      children: [
        Obx(
              () => SummaryCard(
            value:
            controller.presentChildren.value
                .toString(),
            title: 'Present',
            subtitle: 'children',
            valueColor:
            const Color(0xff102A43),
          ),
        ),

        Obx(
              () => SummaryCard(
            value:
            controller.expectedDepartures.value
                .toString(),
            title: 'Expected Today',
            subtitle: 'departures',
            valueColor:
            const Color(0xff8B5DE8),
          ),
        ),

        Obx(
              () => SummaryCard(
            value:
            controller.completedHandovers.value
                .toString(),
            title: 'Completed',
            subtitle: 'handovers',
            valueColor:
            const Color(0xff20B486),
          ),
        ),

        Obx(
              () => SummaryCard(
            value:
            controller.pendingRequests.value
                .toString(),
            title: 'Pending',
            subtitle: 'verify requests',
            valueColor:
            const Color(0xffE8A51C),
          ),
        ),
      ],
    );
  }
}