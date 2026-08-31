import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends GetxController {
  final SupabaseClient _supabase = Supabase.instance.client;

  final fullName = ''.obs;
  final email = ''.obs;
  final phone = ''.obs;
  final role = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() {
    final user = _supabase.auth.currentUser;

    if (user == null) return;

    final metadata = user.userMetadata;

    fullName.value = metadata?['full_name'] ?? '';
    email.value = user.email ?? '';
    phone.value = metadata?['phone'] ?? '';
    role.value = metadata?['role'] ?? '';
  }

  void clearUser() {
    fullName.value = '';
    email.value = '';
    phone.value = '';
    role.value = '';
  }
}