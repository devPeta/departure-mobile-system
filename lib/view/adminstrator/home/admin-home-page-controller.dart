import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  // ==========================================
  // DASHBOARD STATISTICS
  // ==========================================

  final registeredFamilies = 148.obs;
  final enrolledPupils = 186.obs;
  final securityStaff = 14.obs;
  final departuresToday = 89.obs;

  // ==========================================
  // CHART DATA
  // Last 7 days
  // ==========================================

  final departureActivity = <double>[
    0.20,
    0.45,
    0.70,
    0.88,
    0.73,
    0.32,
    0.08,
  ].obs;

  // ==========================================
  // ADMIN ACTIONS
  // ==========================================

  void manageUsers() {
    // TODO:
    // Get.to(() => AdminUsersScreen());
  }

  void runReports() {
    // TODO:
    // Get.to(() => AdminReportsScreen());
  }

  // ==========================================
  // AUDIT ACTIONS
  // ==========================================

  void openAuditLogs() {
    // TODO:
    // Navigate to complete audit log.
  }

  // ==========================================
  // REFRESH
  // ==========================================

  Future<void> refreshDashboard() async {
    // TODO:
    // Replace these with API/Firebase calls.

    await Future.delayed(
      const Duration(milliseconds: 500),
    );
  }
}