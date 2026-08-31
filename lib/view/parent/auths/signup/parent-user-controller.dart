import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ParentUserController extends GetxController {
  final SupabaseClient _supabase = Supabase.instance.client;

  final parentName = ''.obs;
  final email = ''.obs;
  final phoneNumber = ''.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchParentProfile();
  }

  Future<void> fetchParentProfile() async {
    try {
      isLoading.value = true;

      final user = _supabase.auth.currentUser;

      if (user == null) {
        Get.snackbar(
          'Error',
          'No authenticated user found.',
        );
        return;
      }

      final metadata = user.userMetadata;

      parentName.value =
          metadata?['full_name'] ??
              '${metadata?['first_name'] ?? ''} ${metadata?['last_name'] ?? ''}'
                  .trim();

      email.value = user.email ?? '';

      phoneNumber.value =
          metadata?['phone'] ?? '';
    } catch (e) {
      print('Fetch parent profile error: $e');

      Get.snackbar(
        'Error',
        'Unable to load profile information.',
      );
    } finally {
      isLoading.value = false;
    }
  }
}