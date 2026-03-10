// // Path: lib/core/constants/app_colors.dart
// import 'package:flutter/material.dart';

// class AppColors {
//   static const Color primary = Color(0xFF0F4C81); // Classic Blue
//   static const Color secondary = Color(0xFFF29C38); // Orange accent
//   static const Color background = Color(0xFFF8F9FA);
//   static const Color surface = Colors.white;
//   static const Color textPrimary = Color(0xFF212529);
//   static const Color textSecondary = Color(0xFF6C757D);
//   static const Color error = Color(0xFFDC3545);
//   static const Color success = Color(0xFF28A745);
// }

//Gemini Code

// Path: lib/core/constants/app_colors.dart

import 'package:flutter/material.dart';

class AppColors {
  // Website Primary: deep blue/navy
  static const Color primary = Color(0xFF0F172A);

  // Website Accent: usually used for buttons/highlights
  static const Color accent = Color(0xFF3B82F6);

  // Backgrounds
  static const Color background = Color(0xFFFFFFFF); // Clean white
  static const Color surface = Color(
    0xFFF8FAFC,
  ); // Off-white/Slate-50 for cards

  // Typography (Slate palette from Tailwind)
  static const Color textPrimary = Color(0xFF1E293B); // Slate-800
  static const Color textSecondary = Color(0xFF64748B); // Slate-500

  // Status
  static const Color error = Color(0xFFEF4444); // Red-500
  static const Color success = Color(0xFF22C55E); // Green-500
  static const Color warning = Color(0xFFF59E0B); // Amber-500
}
