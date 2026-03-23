import 'package:flutter/material.dart';

/// Color palette mapped from the web project's `globals.css` OKLCH variables.
/// Provides both light and dark mode variants for every semantic token.
class AppColors {
  AppColors._(); // Prevent instantiation

  // ─── Brand Colors ───────────────────────────────────────────────────────
  /// Primary red — vibrant red from the Sameera Auto Traders logo.
  static const Color primaryRed = Color(0xFFE31E24); // oklch(0.55 0.24 27)

  /// Primary red (dark mode) — brighter for dark backgrounds.
  static const Color primaryRedDark = Color(0xFFFF4D4D); // oklch(0.65 0.25 27)

  /// Secondary — near-black from logo.
  static const Color secondaryBlack = Color(0xFF1A1A1A); // oklch(0.2 0.02 0)

  /// Secondary (dark mode) — lighter gray.
  static const Color secondaryDark = Color(0xFF4A4A4A); // oklch(0.3 0.02 0)

  // ─── Backgrounds ────────────────────────────────────────────────────────
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF262626); // oklch(0.15 0.01 0)

  // ─── Surfaces / Cards ──────────────────────────────────────────────────
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF262626);

  static const Color cardLight = Color(0xFFFCFCFC); // oklch(0.99 0 0)
  static const Color cardDark = Color(0xFF383838); // oklch(0.22 0.01 0)

  // ─── Muted (subtle backgrounds) ────────────────────────────────────────
  static const Color mutedLight = Color(0xFFF5F5F5); // oklch(0.96 0.005 0)
  static const Color mutedDark = Color(0xFF4A4A4A); // oklch(0.3 0.01 0)

  static const Color mutedForegroundLight = Color(0xFF808080); // oklch(0.5 0.01 0)
  static const Color mutedForegroundDark = Color(0xFFB8B8B8); // oklch(0.72 0.01 0)

  // ─── Borders & Input ───────────────────────────────────────────────────
  static const Color borderLight = Color(0xFFE0E0E0); // oklch(0.88 0.005 0)
  static const Color borderDark = Color(0xFF555555); // oklch(0.35 0.01 0)

  static const Color inputLight = Color(0xFFF0F0F0); // oklch(0.94 0.005 0)
  static const Color inputDark = Color(0xFF454545); // oklch(0.28 0.01 0)

  // ─── Foreground ────────────────────────────────────────────────────────
  static const Color foregroundLight = Color(0xFF1A1A1A); // oklch(0.15 0.02 0)
  static const Color foregroundDark = Color(0xFFF7F7F7); // oklch(0.97 0.005 0)

  // ─── On-Primary ────────────────────────────────────────────────────────
  static const Color onPrimary = Color(0xFFFFFFFF);

  // ─── Status Colors ─────────────────────────────────────────────────────
  static const Color success = Color(0xFF28A745); // oklch(0.55 0.15 145)
  static const Color successDark = Color(0xFF5CD87D); // oklch(0.68 0.18 145)
  static const Color warning = Color(0xFFFFC107); // oklch(0.65 0.18 75)
  static const Color warningDark = Color(0xFFFFD54F); // oklch(0.72 0.16 75)
  static const Color error = Color(0xFFD32F2F); // oklch(0.577 0.245 27)
  static const Color errorDark = Color(0xFFCC4444); // oklch(0.5 0.18 27)
  static const Color info = Color(0xFF2196F3); // oklch(0.55 0.15 240)
  static const Color infoDark = Color(0xFF64B5F6); // oklch(0.68 0.15 240)
}
