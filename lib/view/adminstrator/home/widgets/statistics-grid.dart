import 'package:daycare_management_system_mobile/view/adminstrator/home/admin-home-page-controller.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/home/widgets/admin-stats-card.dart';
import 'package:flutter/material.dart';

class StatisticsGrid extends StatelessWidget {
  const StatisticsGrid({
    required this.controller,
  });

  final AdminHomeController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 1.65,
      shrinkWrap: true,
      physics:
      const NeverScrollableScrollPhysics(),

      children: [
        AdminStatCard(
          value:
          controller.registeredFamilies.value,
          title: 'Registered Families',
          subtitle: 'households',
        ),

        AdminStatCard(
          value:
          controller.enrolledPupils.value,
          title: 'Enrolled Pupils',
          subtitle: 'active kids',
          valueColor:
          const Color(0xff8B5CF6),
        ),

        AdminStatCard(
          value:
          controller.securityStaff.value,
          title: 'Security Staff',
          subtitle: 'active guards',
          valueColor:
          const Color(0xff20B486),
        ),

        AdminStatCard(
          value:
          controller.departuresToday.value,
          title: 'Departures Today',
          subtitle: 'safe handovers',
        ),
      ],
    );
  }
}