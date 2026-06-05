import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/providers/auth_provider.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/auth/register_screen.dart';
import '../../presentation/screens/sos/main_sos_screen.dart';
import '../../presentation/screens/sos/golden_hour_bundle_screen.dart';
import '../../presentation/screens/sos/helper_bot_screen.dart';
import '../../presentation/screens/sos/active_incident_screen.dart';
import '../../presentation/screens/services_map/services_map_screen.dart';
import '../../presentation/screens/profile/profile_screen.dart';
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
  // v1.1 routes
  static const volunteerDashboard = '/volunteer/dashboard';
  static const volunteerRespond = '/volunteer/incident/:id/respond';
  static const dispatcherDashboard = '/dispatcher/dashboard';
  static const dispatcherIncident = '/dispatcher/incident/:id';
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
  debugLogDiagnostics: true,
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
    StatefulShellRoute.indexedStack(
      builder: (ctx, state, shell) => HomeShell(navigationShell: shell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.sosTrigger,
            name: 'sos-trigger',
            builder: (ctx, state) => const SosTriggerScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.servicesMap,
            name: 'services-map',
            builder: (ctx, state) => const ServicesMapScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.helperBot,
            name: 'helper-bot',
            builder: (ctx, state) => const HelperBotScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.profile,
            name: 'profile',
            builder: (ctx, state) => const ProfileScreen(),
          ),
        ]),
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
    GoRoute(
      path: Routes.incidentDeepLink,
      name: 'incident-deep-link',
      builder: (ctx, state) => IncidentDeepLinkResolver(
        incidentId: state.pathParameters['id']!,
      ),
    ),
  ],
);

// ── Home Shell with Bottom Navigation ────────────────────────────────────────

class HomeShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const HomeShell({super.key, required this.navigationShell});

  static const _tabs = [
    _TabItem(icon: Icons.emergency, activeIcon: Icons.emergency, label: 'SOS'),
    _TabItem(icon: Icons.map_outlined, activeIcon: Icons.map, label: 'Map'),
    _TabItem(icon: Icons.smart_toy_outlined, activeIcon: Icons.smart_toy, label: 'Helper'),
    _TabItem(icon: Icons.person_outline, activeIcon: Icons.person, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0C10),
      body: navigationShell,
      bottomNavigationBar: _RoadSosBottomBar(
        selectedIndex: navigationShell.currentIndex,
        tabs: _tabs,
        onTap: (i) => navigationShell.goBranch(i, initialLocation: i == navigationShell.currentIndex),
      ),
    );
  }
}

class _TabItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _TabItem({required this.icon, required this.activeIcon, required this.label});
}

class _RoadSosBottomBar extends StatelessWidget {
  final int selectedIndex;
  final List<_TabItem> tabs;
  final ValueChanged<int> onTap;

  const _RoadSosBottomBar({required this.selectedIndex, required this.tabs, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0F1219),
        border: Border(top: BorderSide(color: Color(0xFF1E2330), width: 1)),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 64,
          child: Row(
            children: tabs.asMap().entries.map((e) {
              final i = e.key;
              final tab = e.value;
              final selected = i == selectedIndex;
              // Highlight SOS tab with red accent
              final isSos = i == 0;
              final color = selected
                  ? (isSos ? const Color(0xFFFF2D2D) : const Color(0xFFEEF0F5))
                  : const Color(0xFF4A5060);

              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(i),
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SOS tab: round pill badge when selected
                        if (isSos && selected)
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF2D2D).withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(tab.activeIcon, color: color, size: 22),
                          )
                        else
                          Icon(selected ? tab.activeIcon : tab.icon, color: color, size: 22),
                        const SizedBox(height: 4),
                        Text(
                          tab.label,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                            color: color,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// ── Placeholder screen stubs ──────────────────────────────────────────────────

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _fadeAnim;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _scaleAnim = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigate(bool isAuthenticated) {
    if (_navigated) return;
    _navigated = true;
    Future.delayed(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      if (isAuthenticated) {
        context.go(Routes.sosTrigger);
      } else {
        context.go(Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authNotifierProvider, (prev, next) {
      if (!next.isLoading) _navigate(next.isAuthenticated);
    });

    final authState = ref.watch(authNotifierProvider);
    if (!authState.isLoading && !_navigated) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _navigate(authState.isAuthenticated));
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0A0C10),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnim,
          child: ScaleTransition(
            scale: _scaleAnim,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100, height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF1E2330),
                    boxShadow: [BoxShadow(color: const Color(0xFFFF2D2D).withValues(alpha: 0.4), blurRadius: 32, spreadRadius: 8)],
                  ),
                  child: const Icon(Icons.emergency, color: Color(0xFFFF2D2D), size: 56),
                ),
                const SizedBox(height: 24),
                const Text('RoadSoS', style: TextStyle(fontFamily: 'Outfit', fontSize: 40, fontWeight: FontWeight.w700, color: Color(0xFFEEF0F5), letterSpacing: 2)),
                const SizedBox(height: 8),
                const Text('Emergency Response, Fast.', style: TextStyle(fontSize: 14, color: Color(0xFF8A90A0), letterSpacing: 1)),
                const SizedBox(height: 48),
                const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Color(0xFFFF2D2D), strokeWidth: 2.5)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFF0A0C10),
    body: Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.shield_outlined, color: Color(0xFFFF2D2D), size: 64),
        const SizedBox(height: 16),
        const Text('Permissions Required', style: TextStyle(color: Color(0xFFEEF0F5), fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Outfit')),
        const SizedBox(height: 8),
        const Text('RoadSoS needs Location, Notification,\nand Bluetooth access to save lives.', style: TextStyle(color: Color(0xFF8A90A0)), textAlign: TextAlign.center),
        const SizedBox(height: 32),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFF2D2D)),
          onPressed: () => context.go(Routes.login),
          child: const Text('Grant Permissions & Continue'),
        ),
      ]),
    ),
  );
}

class OfflineSosScreen extends StatelessWidget {
  const OfflineSosScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Offline SOS Mode', style: TextStyle(color: Colors.white))));
}

class IncidentDeepLinkResolver extends StatelessWidget {
  final String incidentId;
  const IncidentDeepLinkResolver({super.key, required this.incidentId});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go(Routes.activeIncidentPath(incidentId));
    });
    return const Scaffold(body: Center(child: CircularProgressIndicator(color: Color(0xFFFF2D2D))));
  }
}
