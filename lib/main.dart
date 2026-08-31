import 'package:daycare_management_system_mobile/view/adminstrator/auths/login/admin-login.dart';
import 'package:daycare_management_system_mobile/view/initial-binding.dart';
import 'package:daycare_management_system_mobile/view/onboarding/onboarding-page.dart';
import 'package:daycare_management_system_mobile/view/parent/auths/login/parent-login.dart';
import 'package:daycare_management_system_mobile/view/parent/user-controller.dart';
import 'package:daycare_management_system_mobile/view/role/role-selection-screen.dart';
import 'package:daycare_management_system_mobile/view/staff/auths/login/staff-login.dart';
import 'package:daycare_management_system_mobile/view/storage-services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();

await Supabase.initialize(
url: 'https://mtfrecopprtlreacccrd.supabase.co',
anonKey: 'sb_publishable_INViHxR0-yhKi4cn5-b7gA_DxuNmc6Q',
);

await StorageService.init();

Get.put(UserController(), permanent: true);

runApp(
const MyApp(),
);
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return ScreenUtilInit(
designSize: const Size(375, 812),
minTextAdapt: true,
splitScreenMode: true,
builder: (context, child) {
return GetMaterialApp(
title: 'DayCare Management System',
debugShowCheckedModeBanner: false,

initialBinding: InitialBinding(),

theme: ThemeData(
colorScheme: ColorScheme.fromSeed(
seedColor: const Color(0xff102A43),
),
scaffoldBackgroundColor: Colors.white,
useMaterial3: true,
),

home: _getInitialScreen(),
);
},
);
}

Widget _getInitialScreen() {
if (!StorageService.hasCompletedOnboarding) {
return OnboardingScreen();
}

if (StorageService.selectedRole == null) {
return RoleSelectionScreen();
}

switch (StorageService.selectedRole) {
case 'parent':
return ParentLogin();

case 'staff':
return StaffLogin();

case 'admin':
return AdminLogin();

default:
return RoleSelectionScreen();
}
}
}




//
// import 'package:daycare_management_system_mobile/view/adminstrator/auths/login/admin-login.dart';
// import 'package:daycare_management_system_mobile/view/onboarding/onboarding-page.dart';
// import 'package:daycare_management_system_mobile/view/parent/auths/login/parent-login.dart';
// import 'package:daycare_management_system_mobile/view/role/role-selection-screen.dart';
// import 'package:daycare_management_system_mobile/view/staff/auths/login/staff-login.dart';
// import 'package:daycare_management_system_mobile/view/storage-services.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Initialize Supabase
//   await Supabase.initialize(
//     url: 'https://mtfrecopprtlreacccrd.supabase.co',
//     anonKey: 'sb_publishable_INViHxR0-yhKi4cn5-b7gA_DxuNmc6Q',
//   );
//
//   // Initialize local storage
//   await StorageService.init();
//
//   runApp(
//     const MyApp(),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return GetMaterialApp(
//           title: 'DayCare Management System',
//
//           debugShowCheckedModeBanner: false,
//
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(
//               seedColor: const Color(0xff102A43),
//             ),
//             scaffoldBackgroundColor: Colors.white,
//             useMaterial3: true,
//           ),
//
//           home: _getInitialScreen(),
//         );
//       },
//     );
//   }
//
//   Widget _getInitialScreen() {
//     // User has never completed onboarding
//     if (!StorageService.hasCompletedOnboarding) {
//       return OnboardingScreen();
//     }
//
//     // Onboarding is completed but no role has been selected
//     if (StorageService.selectedRole == null) {
//       return RoleSelectionScreen();
//     }
//
//     // User has completed onboarding and selected a role
//     switch (StorageService.selectedRole) {
//       case 'parent':
//         return ParentLogin();
//
//       case 'staff':
//         return StaffLogin();
//
//       case 'admin':
//         return AdminLogin();
//
//       default:
//         return RoleSelectionScreen();
//     }
//   }
// }