import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _prefs;

  // Keys
  static const String _onboardingCompleteKey =
      'onboarding_complete';

  static const String _selectedRoleKey =
      'selected_role';

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // -----------------------------
  // ONBOARDING
  // -----------------------------

  static bool get hasCompletedOnboarding {
    return _prefs.getBool(_onboardingCompleteKey) ?? false;
  }

  static Future<void> setOnboardingComplete(
      bool value,
      ) async {
    await _prefs.setBool(
      _onboardingCompleteKey,
      value,
    );
  }

  // -----------------------------
  // ROLE
  // -----------------------------

  static String? get selectedRole {
    return _prefs.getString(_selectedRoleKey);
  }

  static Future<void> saveRole(String role) async {
    await _prefs.setString(
      _selectedRoleKey,
      role,
    );
  }

  static Future<void> clearRole() async {
    await _prefs.remove(
      _selectedRoleKey,
    );
  }

  // -----------------------------
  // CLEAR EVERYTHING
  // -----------------------------

  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}