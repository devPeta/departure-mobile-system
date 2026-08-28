import 'package:get/get.dart';

import 'parent-login-controller.dart';

class ParentSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParentLoginController>(
          () => ParentLoginController(),
    );
  }
}
