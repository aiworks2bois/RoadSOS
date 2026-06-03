import 'package:flutter/material.dart';
import 'color_tokens.dart';
import 'text_styles.dart';

/// Spacing grid — 8-point system.
/// Use multiples of [spaceUnit] exclusively. Never hardcode arbitrary values.
abstract final class AppSpacing {
  static const double spaceUnit = 8.0;
  static const double xs  = spaceUnit * 0.5; // 4
  static const double sm  = spaceUnit;        // 8
  static const double md  = spaceUnit * 2;    // 16
  static const double lg  = spaceUnit * 3;    // 24
  static const double xl  = spaceUnit * 4;    // 32
  static const double xxl = spaceUnit * 6;    // 48

  /// Emergency tap target — WCAG AAA for critical actions (SOS button, confirm dialogs).
  static const double emergencyTarget = 64.0;

  /// Standard card border radius.
  static const double radiusMd = 12.0;
  static const double radiusSm = 8.0;
  static const double radiusLg = 20.0;
  static const double radiusFull = 999.0; // pill / circle
}

/// App-wide ThemeData.
///
/// Default theme: dark (emergency-first, low-eye-strain at night).
/// Light theme: auto-applied for dispatcher/judge roles on tablet.
abstract final class AppTheme {
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorTokens.bgPrimary,
        colorScheme: ColorScheme.dark(
          primary: ColorTokens.accentPrimary,
          secondary: ColorTokens.accentSecondary,
          surface: ColorTokens.bgSurface,
          error: ColorTokens.severityCritical,
          onPrimary: ColorTokens.textPrimary,
          onSurface: ColorTokens.textPrimary,
        ),
        textTheme: _buildTextTheme(),
        cardTheme: const CardThemeData(
          color: ColorTokens.bgSurface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSpacing.radiusMd)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorTokens.bgElevated,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            borderSide: const BorderSide(color: ColorTokens.borderSubtle),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            borderSide: const BorderSide(color: ColorTokens.borderFocus, width: 2),
          ),
          labelStyle: AppTextStyles.label,
          hintStyle: AppTextStyles.bodySmall,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorTokens.accentPrimary,
            foregroundColor: ColorTokens.textPrimary,
            textStyle: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
            minimumSize: const Size(double.infinity, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            ),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: ColorTokens.borderSubtle,
          thickness: 1,
        ),
        iconTheme: const IconThemeData(color: ColorTokens.textSecondary),
        useMaterial3: true,
      );

  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
        colorScheme: ColorScheme.light(
          primary: ColorTokens.accentPrimary,
          secondary: ColorTokens.accentSecondary,
          surface: Colors.white,
          error: ColorTokens.severityCritical,
        ),
        useMaterial3: true,
      );

  static TextTheme _buildTextTheme() => TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        headlineLarge: AppTextStyles.heading1,
        headlineMedium: AppTextStyles.heading2,
        headlineSmall: AppTextStyles.heading3,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelMedium: AppTextStyles.label,
        labelSmall: AppTextStyles.caption,
      );
}
