import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Add this import
import '../../onboarding/screens/onboarding_screen.dart';
import '../../auth/screens/login_screen.dart';
import '../../navigation/screens/main_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    final startTime = DateTime.now();

    // 1. Check SharedPreferences for first launch
    final prefs = await SharedPreferences.getInstance();
    final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    // 2. Check Secure Storage for the NextAuth session cookie
    const secureStorage = FlutterSecureStorage();
    final sessionCookie = await secureStorage.read(key: 'session_cookie');
    
    // If the cookie exists and isn't empty, the user is logged in
    final isLoggedIn = sessionCookie != null && sessionCookie.isNotEmpty;

    // Minimum 2-second delay for branding
    final elapsed = DateTime.now().difference(startTime);
    final remainingDelay = const Duration(seconds: 2) - elapsed;
    if (remainingDelay.isNegative == false) {
      await Future.delayed(remainingDelay);
    }

    if (!mounted) return;

    // 3. Navigation Routing Logic
    if (isFirstLaunch) {
      // First launch -> Onboarding
      // Note: You should set isFirstLaunch to false inside your OnboardingScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    } else if (!isLoggedIn) {
      // Not first launch, no session cookie -> Login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      // Has session cookie -> Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  final scale = 0.8 + (0.2 * value);
                  return Opacity(
                    opacity: value,
                    child: Transform.scale(
                      scale: scale,
                      child: child,
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.directions_car_rounded,
                      size: 80,
                      color: colorScheme.primary, 
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Smart Auto Hub',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: colorScheme.primary,
                    ),
                    const SizedBox(height: 32),
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        'v1.0.0',
                        style: textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
