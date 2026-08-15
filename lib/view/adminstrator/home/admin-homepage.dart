import 'package:daycare_management_system_mobile/view/adminstrator/home/admin-home-page-controller.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/home/widgets/activity-chart.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/home/widgets/admin-header.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/home/widgets/audit-list.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/home/widgets/command-activity.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/home/widgets/statistics-grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AdminHome extends StatelessWidget {
  AdminHome({super.key});

  final AdminHomeController controller =
  Get.put(AdminHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.refreshDashboard,

          child: SingleChildScrollView(
            physics:
            const AlwaysScrollableScrollPhysics(),

            padding: const EdgeInsets.fromLTRB(
              6,
              4,
              6,
              30,
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [
                // ==========================================
                // HEADER
                // ==========================================

                const AdminHeader(),

                const SizedBox(height: 18),

                // ==========================================
                // STATISTICS
                // ==========================================

                Obx(
                      () => StatisticsGrid(
                    controller: controller,
                  ),
                ),

                const SizedBox(height: 18),

                // ==========================================
                // ACTIVITY CHART
                // ==========================================

                Obx(
                      () => ActivityChart(
                    values:
                    controller.departureActivity,
                  ),
                ),

                const SizedBox(height: 18),

                // ==========================================
                // COMMAND ACTIONS
                // ==========================================

                const Text(
                  'COMMAND ACTIONS',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff52667A),
                  ),
                ),

                const SizedBox(height: 8),

                CommandActions(
                  controller: controller,
                ),

                const SizedBox(height: 18),

                // ==========================================
                // SYSTEM AUDIT
                // ==========================================

                const Text(
                  'SYSTEM EVENT AUDIT',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff52667A),
                  ),
                ),

                const SizedBox(height: 8),

                AuditList(
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}