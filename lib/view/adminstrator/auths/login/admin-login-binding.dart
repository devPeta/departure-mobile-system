
import 'package:get/get.dart';
import 'admin-login-controller.dart';

class AdminLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminLoginController>(
          () => AdminLoginController(),
    );
  }
}
