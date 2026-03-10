// // Path: lib/features/splash/screens/splash_screen.dart
// import 'package:flutter/material.dart';
// import 'package:smart_auto_hub_app/features/onboarding/screens/onboarding_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToNext();
//   }

//   Future<void> _navigateToNext() async {
//     await Future.delayed(const Duration(seconds: 2));
//     if (!mounted) return;
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (_) => const OnboardingScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.directions_car, size: 100, color: Colors.blue),
//             SizedBox(height: 24),
//             Text('Smart Auto Hub', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Gemini Code

// Path: lib/features/splash/screens/splash_screen.dart

import 'package:flutter/material.dart';
import 'dart:async';
import '../../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() {
    // Artificial delay to simulate initialization (3 seconds)
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        // According to Sprint 1, we move to Onboarding next
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using the primary navy blue from the website theme
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Branding Section
            const Icon(
              Icons.directions_car_filled_rounded,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 24),
            Text(
              'SMART AUTO HUB',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Premium Automotive Excellence',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 48),
            // Loading State (Sprint 1 requirement)
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
            ),
          ],
        ),
      ),
    );
  }
}
