import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_router.dart';

/// GoRouter redirect function — the single source of truth for nav guards.
///
/// Called on every route change. Returns null to allow, or a path to redirect.
/// Guards are evaluated in order; first match wins.
Future<String?> routeGuard(BuildContext context, GoRouterState state) async {
  final location = state.uri.path;

  // ── Public routes — always allow ────────────────────────────────────────────
  const publicRoutes = {
    Routes.splash,
    Routes.onboarding,
    Routes.login,
    Routes.register,
  };
  if (publicRoutes.contains(location)) return null;

  // ── Auth guard — no token = go to login ────────────────────────────────────
  // TODO: inject TokenStore via provider and check getAccessToken() != null.
  // For now, allow all — will be wired when AuthNotifier is implemented.
  // final token = await ref.read(tokenStoreProvider).getAccessToken();
  // if (token == null) return Routes.login;

  // ── Role guard — insufficient role routes to home ───────────────────────────
  // TODO: inject AuthState role from Riverpod.
  // Volunteer/Dispatcher routes are protected here.
  // if (location.startsWith('/volunteer') && role != 'volunteer' && role != 'admin') {
  //   return Routes.sosTrigger;
  // }
  // if (location.startsWith('/dispatcher') && role != 'dispatcher' && role != 'judge' && role != 'admin') {
  //   return Routes.sosTrigger;
  // }

  // ── Deep link role resolution ────────────────────────────────────────────────
  // /incidents/:id → role-aware destination
  // TODO: wire to AuthState.role from Riverpod
  // if (location.startsWith('/incidents/')) {
  //   final id = location.split('/').last;
  //   return switch (role) {
  //     'volunteer'  => Routes.volunteerRespondPath(id),
  //     'dispatcher' => Routes.dispatcherIncidentPath(id),
  //     'judge'      => Routes.dispatcherIncidentPath(id),
  //     _            => Routes.activeIncidentPath(id),
  //   };
  // }

  return null; // Allow navigation.
}
