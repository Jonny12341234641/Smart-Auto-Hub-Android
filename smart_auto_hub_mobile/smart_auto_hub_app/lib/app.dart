// // Path: lib/app.dart
// import 'package:flutter/material.dart';
// import 'package:smart_auto_hub_app/core/theme/app_theme.dart';
// import 'package:smart_auto_hub_app/features/splash/screens/splash_screen.dart';

// class SmartAutoHubApp extends StatelessWidget {
//   const SmartAutoHubApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Smart Auto Hub',
//       theme: AppTheme.lightTheme,
//       home: const SplashScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

//Gemini Code

// Path: lib/app.dart

import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/splash/screens/splash_screen.dart';
// Note: We will create onboarding_screen.dart in the next step
// import 'features/onboarding/screens/onboarding_screen.dart';

class SmartAutoHubApp extends StatelessWidget {
  const SmartAutoHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Auto Hub',
      debugShowCheckedModeBanner: false,

      // Applying the theme we created earlier
      theme: AppTheme.lightTheme,

      // Setting the initial route to the Splash Screen
      initialRoute: '/',

      routes: {
        // Map '/' to the SplashScreen
        '/': (context) => const SplashScreen(),

        // Placeholder for Onboarding (We will create this next)
        '/onboarding': (context) => const Scaffold(
          body: Center(child: Text('Onboarding Screen Placeholder')),
        ),

        // Future routes for Sprint 1:
        // '/login': (context) => const LoginScreen(),
        // '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
