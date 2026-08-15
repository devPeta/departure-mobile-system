import 'package:get/get.dart';

class RoleSelectionController extends GetxController {
  // 0 = Parent / Guardian
  // 1 = Daycare Staff
  // 2 = Administrator
  final selectedRole = 0.obs;

  void selectRole(int index) {
    selectedRole.value = index;
  }

  bool isSelected(int index) {
    return selectedRole.value == index;
  }

  String get selectedRoleName {
    switch (selectedRole.value) {
      case 0:
        return 'Parent / Guardian';
      case 1:
        return 'Daycare Staff';
      case 2:
        return 'Administrator';
      default:
        return 'Parent / Guardian';
    }
  }
}