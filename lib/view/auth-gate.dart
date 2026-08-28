import 'package:daycare_management_system_mobile/view/parent/auths/login/parent-login.dart';
import 'package:daycare_management_system_mobile/view/parent/home/navigation/parent-navigation-bar.dart';
import 'package:daycare_management_system_mobile/view/role/role-selection-screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class AuthGate extends StatelessWidget {
  final bool onboardingComplete;
  const AuthGate({super.key, required this.onboardingComplete});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final session = snapshot.data?.session;

        if (session != null) {
          return  ParentBottomNavigation();
        }

        if (!onboardingComplete) {
          return RoleSelectionScreen();
        }

        return ParentLogin();
      },
    );
  }
}