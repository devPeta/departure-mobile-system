import 'package:daycare_management_system_mobile/view/parent/home/homepage/parent-home.dart';
import 'package:daycare_management_system_mobile/view/parent/home/navigation/parent-navigation-bar.dart';
import 'package:daycare_management_system_mobile/view/parent/home/navigation/parent-navigation-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ParentDashboard extends StatelessWidget {
  ParentDashboard({super.key});

  final ParentNavigationController controller =
  Get.put(
    ParentNavigationController(),
    permanent: true,
  );

  final List<Widget> pages = [
    ParentHome(),
    const _PlaceholderPage(
      title: 'Children',
      icon: Icons.people_outline_rounded,
    ),
    const _PlaceholderPage(
      title: 'History',
      icon: Icons.assignment_outlined,
    ),
    const _PlaceholderPage(
      title: 'Alerts',
      icon: Icons.notifications_none_rounded,
    ),
    const _PlaceholderPage(
      title: 'Profile',
      icon: Icons.settings_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: Obx(
            () => IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),
      ),

      bottomNavigationBar:
      ParentBottomNavigation(),
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: const Color(0xff102A43),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xff102A43),
              ),
            ),
          ],
        ),
      ),
    );
  }
}