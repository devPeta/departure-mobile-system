
import 'package:get/get.dart';
import 'staff-login-controller.dart';

class StaffLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaffLoginController>(
          () => StaffLoginController(),
    );
  }
}
