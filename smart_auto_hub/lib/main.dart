import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/splash/screens/splash_screen.dart';

void main() {
  runApp(const SmartAutoHub());
}

class SmartAutoHub extends StatelessWidget {
  const SmartAutoHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Auto Hub',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Switches based on OS settings
      home: const SplashScreen(), // Set the splash screen as the home
    );
  }
}
