
import 'package:daycare_management_system_mobile/view/adminstrator/auths/login/admin-login-binding.dart';
import 'package:daycare_management_system_mobile/view/parent/auths/login/parent-login.dart';
import 'package:daycare_management_system_mobile/view/staff/auths/login/staff-login.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/auths/login/admin-login.dart';
import 'package:daycare_management_system_mobile/view/staff/auths/login/staff-signup-binding.dart';
import 'package:daycare_management_system_mobile/view/storage-services.dart';

import 'package:get/get.dart';

import '../parent/auths/login/parent-binding-login.dart';

enum UserRole {
  parent,
  staff,
  admin,
}

class RoleSelectionController extends GetxController {
  // No role selected initially
  final Rx<UserRole?> selectedRole =
  Rx<UserRole?>(null);

  // Select role
  void selectRole(UserRole role) {
    selectedRole.value = role;
  }

  // Check selected role
  bool isSelected(UserRole role) {
    return selectedRole.value == role;
  }

  // Continue
  Future<void> continueToLogin() async {
    final UserRole? role = selectedRole.value;

    // Make sure user selected a role
    if (role == null) {
      Get.snackbar(
        'Select a role',
        'Please select your role before continuing.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    // Save selected role locally
    await StorageService.saveRole(
      role.name,
    );

    switch (role) {
      case UserRole.parent:
        Get.offAll(
              () => ParentLogin(),
          binding: ParentLoginBinding(),
        );
        break;

      case UserRole.staff:
        Get.offAll(
              () => StaffLogin(),
          binding: StaffLoginBinding(),
        );
        break;

      case UserRole.admin:
        Get.offAll(
              () => AdminLogin(),
          binding: AdminLoginBinding(),
        );
        break;
    }
  }
}



