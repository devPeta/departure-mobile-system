import 'package:daycare_management_system_mobile/view/adminstrator/home/admin-homepage.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/navigation/admin-navigation-controller.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/settings/admin-setting-screen.dart';
import 'package:daycare_management_system_mobile/view/staff/children/staff-children-screen.dart';
import 'package:daycare_management_system_mobile/view/staff/home/staff-homepage.dart';
import 'package:daycare_management_system_mobile/view/staff/navigation/staff-navigation-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffBottomNavigation extends StatelessWidget {
  StaffBottomNavigation({super.key});

  final StaffNavigationController controller =
  Get.put(StaffNavigationController());

  final List<Widget> pages = [
    StaffHome(),

    StaffChildren(),
    AdminSettings(),

  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        backgroundColor: const Color(0xffF8FAFC),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),

        bottomNavigationBar: _buildNavigationBar(),
      ),
    );
  }

  Widget _buildNavigationBar() {
    final items = [
      _NavigationItem(
        icon: Icons.home_outlined,
        activeIcon: Icons.home_rounded,
        label: 'Home',
      ),

      _NavigationItem(
        icon: Icons.child_care,
        activeIcon: Icons.home_rounded,
        label: 'Children',
      ),


      _NavigationItem(
        icon: Icons.settings_outlined,
        activeIcon: Icons.settings_rounded,
        label: 'Profile',
      ),
    ];

    return Container(
      height: 78,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xffE2E8F0),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: List.generate(
          items.length,
              (index) {
            final item = items[index];

            final isSelected =
                controller.currentIndex.value == index;

            return Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  controller.changeTab(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isSelected
                            ? item.activeIcon
                            : item.icon,
                        size: 23,
                        color: isSelected
                            ? const Color(0xff102A43)
                            : const Color(0xffA1ACB8),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isSelected
                              ? const Color(0xff102A43)
                              : const Color(0xffA1ACB8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _NavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const _NavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

// import 'package:daycare_management_system_mobile/view/parent/home/navigation/staff-navigation-controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class ParentBottomNavigation extends StatelessWidget {
//   ParentBottomNavigation({
//     super.key,
//   });
//
//   final ParentNavigationController controller =
//   Get.find<ParentNavigationController>();
//
//   final List<_NavigationItem> items = const [
//     _NavigationItem(
//       icon: Icons.home_outlined,
//       activeIcon: Icons.home_rounded,
//       label: 'Home',
//     ),
//     _NavigationItem(
//       icon: Icons.people_outline_rounded,
//       activeIcon: Icons.people_rounded,
//       label: 'Children',
//     ),
//     _NavigationItem(
//       icon: Icons.assignment_outlined,
//       activeIcon: Icons.assignment_rounded,
//       label: 'History',
//     ),
//     _NavigationItem(
//       icon: Icons.notifications_none_rounded,
//       activeIcon: Icons.notifications_rounded,
//       label: 'Alerts',
//     ),
//     _NavigationItem(
//       icon: Icons.settings_outlined,
//       activeIcon: Icons.settings_rounded,
//       label: 'Profile',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//           () => Container(
//         height: 78,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           border: Border(
//             top: BorderSide(
//               color: Color(0xffE2E8F0),
//               width: 1,
//             ),
//           ),
//         ),
//         child: Row(
//           children: List.generate(
//             items.length,
//                 (index) {
//               final item = items[index];
//
//               final isSelected =
//                   controller.currentIndex.value == index;
//
//               return Expanded(
//                 child: GestureDetector(
//                   behavior: HitTestBehavior.opaque,
//                   onTap: () {
//                     controller.changeTab(index);
//                   },
//                   child: AnimatedContainer(
//                     duration: const Duration(
//                       milliseconds: 200,
//                     ),
//                     child: Column(
//                       mainAxisAlignment:
//                       MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           isSelected
//                               ? item.activeIcon
//                               : item.icon,
//                           size: 23,
//                           color: isSelected
//                               ? const Color(0xff102A43)
//                               : const Color(0xffA1ACB8),
//                         ),
//
//                         const SizedBox(height: 5),
//
//                         Text(
//                           item.label,
//                           style: TextStyle(
//                             fontSize: 11,
//                             fontWeight: isSelected
//                                 ? FontWeight.w600
//                                 : FontWeight.w400,
//                             color: isSelected
//                                 ? const Color(0xff102A43)
//                                 : const Color(0xffA1ACB8),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _NavigationItem {
//   final IconData icon;
//   final IconData activeIcon;
//   final String label;
//
//   const _NavigationItem({
//     required this.icon,
//     required this.activeIcon,
//     required this.label,
//   });
// }