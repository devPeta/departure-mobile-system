import 'package:daycare_management_system_mobile/view/parent/auths/login/parent-binding-login.dart';
import 'package:daycare_management_system_mobile/view/parent/auths/signup/parent-binding.dart';
import 'package:get/get.dart';


class InitialBinding extends Bindings {
@override
void dependencies() {
    ParentLoginBinding().dependencies();
    ParentSignupBinding().dependencies();

    }
}
