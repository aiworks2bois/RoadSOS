import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/sos/main_sos_screen.dart';
import '../../presentation/screens/sos/golden_hour_bundle_screen.dart';
import '../../presentation/screens/sos/helper_bot_screen.dart';
import '../../presentation/screens/services_map/services_map_screen.dart';
import '../../presentation/screens/volunteer/volunteer_dashboard_screen.dart';
import '../../presentation/screens/volunteer/volunteer_respond_screen.dart';
import '../../presentation/screens/dispatcher/dispatcher_dashboard_screen.dart';
import '../../presentation/screens/dispatcher/dispatcher_incident_screen.dart';
import 'route_guards.dart';

// ── Route names (type-safe constants) ────────────────────────────────────────

abstract final class Routes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const login = '/auth/login';
  static const register = '/auth/register';
  static const home = '/home';
  static const sosTrigger = '/home/sos';
  static const servicesMap = '/home/map';
  static const helperBot = '/home/helper';
  static const profile = '/home/profile';
  static const bundle = '/sos/bundle/:id';
  static const activeIncident = '/sos/active/:id';
  static const offlineSos = '/sos/offline';
  // v1.1 routes — defined now so deep links work immediately after FCM lands.
  static const volunteerDashboard = '/volunteer/dashboard';
  static const volunteerRespond = '/volunteer/incident/:id/respond';
  static const dispatcherDashboard = '/dispatcher/dashboard';
  static const dispatcherIncident = '/dispatcher/incident/:id';
  // Universal deep-link resolver (role-aware).
  static const incidentDeepLink = '/incidents/:id';

  // Helpers to build parameterised paths.
  static String bundlePath(String id) => '/sos/bundle/$id';
  static String activeIncidentPath(String id) => '/sos/active/$id';
  static String volunteerRespondPath(String id) => '/volunteer/incident/$id/respond';
  static String dispatcherIncidentPath(String id) => '/dispatcher/incident/$id';
  static String incidentPath(String id) => '/incidents/$id';
}

// ── Router ───────────────────────────────────────────────────────────────────

final appRouter = GoRouter(
  initialLocation: Routes.splash,
  debugLogDiagnostics: true, // disable in prod via AppConfig flag
  redirect: routeGuard,
  routes: [
    // ── Splash ──────────────────────────────────────────────────────────────
    GoRoute(
      path: Routes.splash,
      name: 'splash',
      builder: (ctx, state) => const SplashScreen(),
    ),

    // ── Onboarding ──────────────────────────────────────────────────────────
    GoRoute(
      path: Routes.onboarding,
      name: 'onboarding',
      builder: (ctx, state) => const OnboardingScreen(),
    ),

    // ── Auth ────────────────────────────────────────────────────────────────
    GoRoute(
      path: Routes.login,
      name: 'login',
      builder: (ctx, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.register,
      name: 'register',
      builder: (ctx, state) => const RegisterScreen(),
    ),

    // ── Home Shell (role-aware bottom nav) ───────────────────────────────────
    ShellRoute(
      builder: (ctx, state, child) => HomeShell(child: child),
      routes: [
        GoRoute(
          path: Routes.sosTrigger,
          name: 'sos-trigger',
          builder: (ctx, state) => const SosTriggerScreen(),
        ),
        GoRoute(
          path: Routes.servicesMap,
          name: 'services-map',
          builder: (ctx, state) => const ServicesMapScreen(),
        ),
        GoRoute(
          path: Routes.helperBot,
          name: 'helper-bot',
          builder: (ctx, state) => const HelperBotScreen(),
        ),
        GoRoute(
          path: Routes.profile,
          name: 'profile',
          builder: (ctx, state) => const ProfileScreen(),
        ),
      ],
    ),

    // ── SOS Flows ───────────────────────────────────────────────────────────
    GoRoute(
      path: Routes.bundle,
      name: 'bundle',
      builder: (ctx, state) => GoldenHourBundleScreen(
        incidentId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: Routes.activeIncident,
      name: 'active-incident',
      builder: (ctx, state) => ActiveIncidentScreen(
        incidentId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: Routes.offlineSos,
      name: 'offline-sos',
      builder: (ctx, state) => const OfflineSosScreen(),
    ),

    // ── Volunteer (v1.1) ────────────────────────────────────────────────────
    GoRoute(
      path: Routes.volunteerDashboard,
      name: 'volunteer-dashboard',
      builder: (ctx, state) => const VolunteerDashboardScreen(),
    ),
    GoRoute(
      path: Routes.volunteerRespond,
      name: 'volunteer-respond',
      builder: (ctx, state) => VolunteerRespondScreen(
        incidentId: state.pathParameters['id']!,
      ),
    ),

    // ── Dispatcher (v1.1) ────────────────────────────────────────────────────
    GoRoute(
      path: Routes.dispatcherDashboard,
      name: 'dispatcher-dashboard',
      builder: (ctx, state) => const DispatcherDashboardScreen(),
    ),
    GoRoute(
      path: Routes.dispatcherIncident,
      name: 'dispatcher-incident',
      builder: (ctx, state) => DispatcherIncidentScreen(
        incidentId: state.pathParameters['id']!,
      ),
    ),

    // ── Deep Link Resolver (FCM notifications) ───────────────────────────────
    // Role-aware: user → active incident, volunteer → respond, dispatcher → detail
    GoRoute(
      path: Routes.incidentDeepLink,
      name: 'incident-deep-link',
      redirect: (ctx, state) {
        // Role resolution is handled in route_guards.dart based on AuthState.
        return null; // Resolved in routeGuard.
      },
      builder: (ctx, state) => IncidentDeepLinkResolver(
        incidentId: state.pathParameters['id']!,
      ),
    ),
  ],
);

// ── Placeholder screen stubs ──────────────────────────────────────────────────
// Each is replaced by its full implementation in the feature files.

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: CircularProgressIndicator()));
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Placeholder());
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Placeholder());
}

class HomeShell extends StatelessWidget {
  final Widget child;
  const HomeShell({super.key, required this.child});
  @override
  Widget build(BuildContext context) => Scaffold(body: child);
}


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Placeholder());
}



class ActiveIncidentScreen extends StatelessWidget {
  final String incidentId;
  const ActiveIncidentScreen({super.key, required this.incidentId});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Placeholder());
}


@TypedGoRoute<GoldenHourBundleRoute>(path: '/bundle/:incidentId')
class GoldenHourBundleRoute extends GoRouteData {
  final String incidentId;
  const GoldenHourBundleRoute({required this.incidentId});
  @override
  Widget build(BuildContext context, GoRouterState state) => GoldenHourBundleScreen(incidentId: incidentId);
}

class OfflineSosScreen extends StatelessWidget {
  const OfflineSosScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Placeholder());
}

class IncidentDeepLinkResolver extends StatelessWidget {
  final String incidentId;
  const IncidentDeepLinkResolver({super.key, required this.incidentId});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Placeholder());
}
