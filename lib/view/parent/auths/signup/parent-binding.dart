import 'package:get/get.dart';

import 'parent-signup-controller.dart';

class ParentSignupBinding extends Bindings {
@override
void dependencies() {
  Get.lazyPut<ParentSignupController>(
      () => ParentSignupController(),
    );
  }
}
