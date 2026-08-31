
import 'package:get/get.dart';

import 'parent-login-controller.dart';

class ParentLoginBinding extends Bindings {
@override
  void dependencies() {
    Get.lazyPut<ParentLoginController>(
        () => ParentLoginController(),
    );
  }
}

