import 'package:flutter/material.dart';

/// Full colour token system from 03_DESIGN_SYSTEM.md.
///
/// Naming convention mirrors the design spec exactly so designers and devs
/// use the same vocabulary. Never use raw hex strings outside this file.
abstract final class ColorTokens {
  // ── Background ─────────────────────────────────────────────────────────────
  static const Color bgPrimary  = Color(0xFF0A0C10); // main screen background
  static const Color bgSurface  = Color(0xFF141820); // cards, bottom sheets
  static const Color bgElevated = Color(0xFF1E2330); // elevated cards, modals
  static const Color bgOverlay  = Color(0xCC0A0C10); // dark overlay for dialogs

  // ── Severity ────────────────────────────────────────────────────────────────
  static const Color severityCritical = Color(0xFFFF2D2D); // P1 — life threatening
  static const Color severityHigh     = Color(0xFFFF8C00); // P2 — urgent
  static const Color severityMedium   = Color(0xFFFFD600); // P3 — moderate
  static const Color severityLow      = Color(0xFF4CAF50); // P4 — minor

  // ── SOS Accent ──────────────────────────────────────────────────────────────
  static const Color accentSOS       = Color(0xFFFF2D2D); // SOS button
  static const Color accentSOSGlow   = Color(0x33FF2D2D); // pulsing ring glow
  static const Color accentPrimary   = Color(0xFF2979FF); // primary action
  static const Color accentSecondary = Color(0xFF00B0FF); // secondary links
  static const Color accentSuccess   = Color(0xFF00E676); // success / confirmed
  static const Color accentWarning   = Color(0xFFFF8C00); // warning states

  // ── Text ────────────────────────────────────────────────────────────────────
  static const Color textPrimary   = Color(0xFFEEF0F5); // body text
  static const Color textSecondary = Color(0xFF8A90A0); // captions, labels
  static const Color textDisabled  = Color(0xFF4A5060); // disabled state
  static const Color textInverse   = Color(0xFF0A0C10); // text on light bg

  // ── Trust Score (service reliability) ───────────────────────────────────────
  static const Color trustHigh = Color(0xFF00E676); // ≥ 0.80 — verified
  static const Color trustMid  = Color(0xFFFFD600); // 0.60–0.79 — partial
  static const Color trustLow  = Color(0xFFFF8C00); // < 0.60 — unverified

  /// Resolves a trust score (0.0–1.0) to the appropriate colour.
  static Color forTrustScore(double score) {
    if (score >= 0.8) return trustHigh;
    if (score >= 0.6) return trustMid;
    return trustLow;
  }

  // ── Map Pins ────────────────────────────────────────────────────────────────
  static const Color mapVictimPin    = Color(0xFFFF2D2D); // victim location
  static const Color mapResponderPin = Color(0xFF00E676); // volunteer/responder
  static const Color mapServicePin   = Color(0xFFFFD600); // emergency services
  static const Color mapClusterPin   = Color(0xFF2979FF); // MCI cluster

  // ── Status ──────────────────────────────────────────────────────────────────
  static const Color wsLive         = Color(0xFF00E676); // ● Live
  static const Color wsReconnecting = Color(0xFFFFD600); // ◉ Reconnecting
  static const Color wsOffline      = Color(0xFF8A90A0); // ○ Offline

  // ── Borders & Dividers ───────────────────────────────────────────────────────
  static const Color borderSubtle = Color(0xFF2A3040);
  static const Color borderFocus  = Color(0xFF2979FF);
}
