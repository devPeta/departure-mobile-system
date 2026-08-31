import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase =
      Supabase.instance.client;

  // --------------------------------------------------
  // PARENT SIGN UP
  // --------------------------------------------------

  Future<AuthResponse> signUpParent({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'full_name': '$firstName $lastName',
        'phone': phone,
        'role': 'parent',
      },
    );
  }

  // --------------------------------------------------
  // LOGIN
  // --------------------------------------------------

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // --------------------------------------------------
  // CURRENT USER
  // --------------------------------------------------

  User? get currentUser {
    return _supabase.auth.currentUser;
  }

  // --------------------------------------------------
  // CURRENT SESSION
  // --------------------------------------------------

  Session? get currentSession {
    return _supabase.auth.currentSession;
  }

  // --------------------------------------------------
  // LOGOUT
  // --------------------------------------------------

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // --------------------------------------------------
  // PASSWORD RESET
  // --------------------------------------------------

  Future<void> resetPassword({
    required String email,
  }) async {
    await _supabase.auth.resetPasswordForEmail(
      email,
    );
  }

  // --------------------------------------------------
  // AUTH STATE
  // --------------------------------------------------

  Stream<AuthState> get authStateChanges {
    return _supabase.auth.onAuthStateChange;
  }
}
