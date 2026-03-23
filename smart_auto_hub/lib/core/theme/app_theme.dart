import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Centralized theme matching the web project's design system.
/// All component themes are defined here so screens can use
/// `Theme.of(context)` instead of hardcoding `AppColors`.
class AppTheme {
  AppTheme._();

  // ─── Shared Constants ─────────────────────────────────────────────────
  static const double _radius = 10.0; // 0.625rem from web globals.css
  static final BorderRadius _borderRadius = BorderRadius.circular(_radius);
  static final BorderRadius _sheetRadius = BorderRadius.vertical(
    top: Radius.circular(20),
  );

  // ─── Light Theme ──────────────────────────────────────────────────────
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Color Scheme — explicit mapping from globals.css :root
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryRed,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.mutedLight,
      onPrimaryContainer: AppColors.primaryRed,
      secondary: AppColors.secondaryBlack,
      onSecondary: Colors.white,
      secondaryContainer: AppColors.mutedLight,
      onSecondaryContainer: AppColors.secondaryBlack,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.foregroundLight,
      onSurfaceVariant: AppColors.mutedForegroundLight,
      error: AppColors.error,
      onError: Colors.white,
      outline: AppColors.borderLight,
      outlineVariant: AppColors.borderLight,
    ),

    // Scaffold
    scaffoldBackgroundColor: AppColors.backgroundLight,

    // Typography — Inter (closest to Geist available via Google Fonts)
    textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),

    // Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.borderLight,
      thickness: 1,
    ),

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceLight,
      foregroundColor: AppColors.foregroundLight,
      elevation: 0,
      scrolledUnderElevation: 0.5,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.foregroundLight,
      ),
    ),

    // Cards
    cardTheme: CardThemeData(
      color: AppColors.cardLight,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      margin: EdgeInsets.zero,
    ),

    // Input Fields — filled, borderless, matching web inputs
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.foregroundLight.withOpacity(0.05),
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      border: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(color: AppColors.primaryRed, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(color: AppColors.error, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(color: AppColors.error, width: 2.0),
      ),
      hintStyle: TextStyle(color: AppColors.mutedForegroundLight),
      prefixIconColor: AppColors.mutedForegroundLight,
      suffixIconColor: AppColors.mutedForegroundLight,
    ),

    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryRed,
        foregroundColor: AppColors.onPrimary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        minimumSize: const Size(double.infinity, 50),
      ),
    ),

    // Outlined Button
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.foregroundLight,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        side: BorderSide(color: AppColors.foregroundLight.withOpacity(0.2)),
        minimumSize: const Size(double.infinity, 50),
      ),
    ),

    // Text Button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryRed,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),

    // Dialog
    dialogTheme: DialogThemeData(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      backgroundColor: AppColors.surfaceLight,
    ),

    // Bottom Sheet
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.surfaceLight,
      shape: RoundedRectangleBorder(borderRadius: _sheetRadius),
      elevation: 8,
    ),

    // SnackBar
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
    ),

    // Chip
    chipTheme: ChipThemeData(
      selectedColor: AppColors.primaryRed.withOpacity(0.12),
      checkmarkColor: AppColors.primaryRed,
      side: BorderSide(color: AppColors.borderLight),
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
    ),

    // Floating Action Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryRed,
      foregroundColor: AppColors.onPrimary,
      elevation: 4,
    ),

    // Navigation Bar (bottom)
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.transparent,
      indicatorColor: AppColors.primaryRed.withOpacity(0.1),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.primaryRed);
        }
        return const IconThemeData(color: Colors.grey);
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            color: AppColors.primaryRed,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          );
        }
        return const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        );
      }),
    ),

    // Progress Indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryRed,
    ),
  );

  // ─── Dark Theme ───────────────────────────────────────────────────────
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // Color Scheme — explicit mapping from globals.css .dark
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryRedDark,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.mutedDark,
      onPrimaryContainer: AppColors.primaryRedDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.foregroundDark,
      secondaryContainer: AppColors.mutedDark,
      onSecondaryContainer: AppColors.foregroundDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.foregroundDark,
      onSurfaceVariant: AppColors.mutedForegroundDark,
      error: AppColors.errorDark,
      onError: AppColors.foregroundDark,
      outline: AppColors.borderDark,
      outlineVariant: AppColors.borderDark,
    ),

    // Scaffold
    scaffoldBackgroundColor: AppColors.backgroundDark,

    // Typography
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),

    // Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.borderDark,
      thickness: 1,
    ),

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: AppColors.foregroundDark,
      elevation: 0,
      scrolledUnderElevation: 0.5,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.foregroundDark,
      ),
    ),

    // Cards
    cardTheme: CardThemeData(
      color: AppColors.cardDark,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      margin: EdgeInsets.zero,
    ),

    // Input Fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.foregroundDark.withOpacity(0.05),
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      border: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(color: AppColors.primaryRedDark, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(color: AppColors.errorDark, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: const BorderSide(color: AppColors.errorDark, width: 2.0),
      ),
      hintStyle: TextStyle(color: AppColors.mutedForegroundDark),
      prefixIconColor: AppColors.mutedForegroundDark,
      suffixIconColor: AppColors.mutedForegroundDark,
    ),

    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryRedDark,
        foregroundColor: AppColors.onPrimary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        minimumSize: const Size(double.infinity, 50),
      ),
    ),

    // Outlined Button
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.foregroundDark,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        side: BorderSide(color: AppColors.foregroundDark.withOpacity(0.2)),
        minimumSize: const Size(double.infinity, 50),
      ),
    ),

    // Text Button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryRedDark,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),

    // Dialog
    dialogTheme: DialogThemeData(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      backgroundColor: AppColors.cardDark,
    ),

    // Bottom Sheet
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.cardDark,
      shape: RoundedRectangleBorder(borderRadius: _sheetRadius),
      elevation: 8,
    ),

    // SnackBar
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
    ),

    // Chip
    chipTheme: ChipThemeData(
      selectedColor: AppColors.primaryRedDark.withOpacity(0.15),
      checkmarkColor: AppColors.primaryRedDark,
      side: BorderSide(color: AppColors.borderDark),
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
    ),

    // Floating Action Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryRedDark,
      foregroundColor: AppColors.onPrimary,
      elevation: 4,
    ),

    // Navigation Bar (bottom)
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.transparent,
      indicatorColor: AppColors.primaryRedDark.withOpacity(0.1),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.primaryRedDark);
        }
        return const IconThemeData(color: Colors.grey);
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            color: AppColors.primaryRedDark,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          );
        }
        return const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        );
      }),
    ),

    // Progress Indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryRedDark,
    ),
  );
}
