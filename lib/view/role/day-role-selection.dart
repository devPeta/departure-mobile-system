import 'package:daycare_management_system_mobile/view/daycarestaff/auths/login/staff-login.dart';
import 'package:daycare_management_system_mobile/view/parent/auths/login/parent-login.dart';
import 'package:get/get.dart';

import '../adminstrator/auths/login/admin-login.dart';

enum UserRole {
  parent,
  staff,
  admin,
}

class RoleSelectionController extends GetxController {
  // Parent is selected by default
  final Rx<UserRole> selectedRole = UserRole.parent.obs;

  // Select a role
  void selectRole(UserRole role) {
    selectedRole.value = role;
  }

  // Check whether a particular role is selected
  bool isSelected(UserRole role) {
    return selectedRole.value == role;
  }

  // Navigate to the appropriate login screen
  void continueToLogin() {
    switch (selectedRole.value) {
      case UserRole.parent:
        Get.to(() => ParentLogin());
        break;

      case UserRole.staff:
        Get.to(() => StaffLogin());
        break;

      case UserRole.admin:
        Get.to(() => AdminLogin());
        break;
    }
  }
}