import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_tokens.dart';

/// Typography system from 03_DESIGN_SYSTEM.md.
///
/// Primary typeface: Space Grotesk — modern, high-legibility, strong emergency feel.
/// Mono typeface:    JetBrains Mono — coordinates, incident IDs, sensor readings.
///
/// All styles use ColorTokens.textPrimary by default.
/// Override colour at the widget level for semantic variants.
abstract final class AppTextStyles {
  // ── Display ─────────────────────────────────────────────────────────────────

  /// Hero numbers — golden hour countdown, risk score
  static TextStyle get displayLarge => GoogleFonts.spaceGrotesk(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: ColorTokens.textPrimary,
        height: 1.1,
      );

  static TextStyle get displayMedium => GoogleFonts.spaceGrotesk(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: ColorTokens.textPrimary,
        height: 1.2,
      );

  // ── SOS ─────────────────────────────────────────────────────────────────────

  /// SOS button label — must be readable at arm's length
  static TextStyle get sosTrigger => GoogleFonts.spaceGrotesk(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: ColorTokens.textPrimary,
        letterSpacing: 4.0,
        height: 1.0,
      );

  // ── Action Plan ─────────────────────────────────────────────────────────────

  /// Golden hour bundle action plan steps — 20sp minimum (WCAG emergency legibility)
  static TextStyle get actionStep => GoogleFonts.spaceGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorTokens.textPrimary,
        height: 1.5,
      );

  // ── Severity Badge ───────────────────────────────────────────────────────────

  /// P1 CRITICAL, P2 HIGH, etc. — always uppercase
  static TextStyle get severityBadge => GoogleFonts.spaceGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: ColorTokens.textPrimary,
        letterSpacing: 2.0,
      );

  // ── Body ────────────────────────────────────────────────────────────────────

  static TextStyle get bodyLarge => GoogleFonts.spaceGrotesk(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: ColorTokens.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.spaceGrotesk(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorTokens.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.spaceGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorTokens.textSecondary,
        height: 1.4,
      );

  // ── Labels & Captions ────────────────────────────────────────────────────────

  static TextStyle get label => GoogleFonts.spaceGrotesk(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: ColorTokens.textSecondary,
        letterSpacing: 0.8,
      );

  static TextStyle get labelLarge => GoogleFonts.spaceGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: ColorTokens.textSecondary,
        letterSpacing: 0.5,
      );

  static TextStyle get labelMedium => GoogleFonts.spaceGrotesk(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: ColorTokens.textSecondary,
        letterSpacing: 0.4,
      );

  static TextStyle get labelSmall => GoogleFonts.spaceGrotesk(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: ColorTokens.textSecondary,
        letterSpacing: 0.6,
      );

  static TextStyle get caption => GoogleFonts.spaceGrotesk(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: ColorTokens.textDisabled,
      );

  // ── Monospace — coordinates, IDs, sensor readings ───────────────────────────

  static TextStyle get mono => GoogleFonts.jetBrainsMono(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: ColorTokens.textSecondary,
        height: 1.4,
      );

  static TextStyle get monoLarge => GoogleFonts.jetBrainsMono(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorTokens.textPrimary,
        height: 1.3,
      );

  // ── Headings ────────────────────────────────────────────────────────────────

  static TextStyle get heading1 => GoogleFonts.spaceGrotesk(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: ColorTokens.textPrimary,
        height: 1.2,
      );

  static TextStyle get heading2 => GoogleFonts.spaceGrotesk(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: ColorTokens.textPrimary,
        height: 1.3,
      );

  static TextStyle get heading3 => GoogleFonts.spaceGrotesk(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: ColorTokens.textPrimary,
        height: 1.4,
      );
}
