import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/config/app_config.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'domain/providers/core_providers.dart';

class RoadSosApp extends ConsumerWidget {
  const RoadSosApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Force init of local db and offline queue just to have them active
    ref.read(appDatabaseProvider);
    ref.read(offlineQueueProvider);

    return MaterialApp.router(
      title: 'RoadSoS',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: AppConfig.current.flavor == AppFlavor.dev,
    );
  }
}
