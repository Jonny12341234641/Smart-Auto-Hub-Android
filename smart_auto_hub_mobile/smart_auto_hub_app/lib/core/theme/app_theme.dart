// // Path: lib/core/theme/app_theme.dart
// import 'package:flutter/material.dart';
// import '../constants/app_colors.dart';

// class AppTheme {
//   static ThemeData get lightTheme {
//     return ThemeData(
//       primaryColor: AppColors.primary,
//       scaffoldBackgroundColor: AppColors.background,
//       colorScheme: const ColorScheme.light(
//         primary: AppColors.primary,
//         secondary: AppColors.secondary,
//         surface: AppColors.surface,
//         error: AppColors.error,
//       ),
//       appBarTheme: const AppBarTheme(
//         backgroundColor: AppColors.primary,
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primary,
//           foregroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//       textTheme: const TextTheme(
//         displayLarge: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
//         bodyLarge: TextStyle(color: AppColors.textPrimary),
//         bodyMedium: TextStyle(color: AppColors.textSecondary),
//       ),
//     );
//   }
// }

//Gemini code

// Path: lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
        error: AppColors.error,
        onPrimary: Colors.white,
      ),

      // Typography styling to match website's clean sans-serif look
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
        bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16),
        bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14),
      ),

      // Navigation Bar styling using the brand's primary navy
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.accent.withOpacity(0.1),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.accent);
          }
          return const IconThemeData(color: AppColors.textSecondary);
        }),
      ),

      // Button styling to match the website's rounded action buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
    );
  }
}
