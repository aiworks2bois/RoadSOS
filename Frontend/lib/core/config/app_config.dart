/// App flavors and environment configuration.
///
/// Usage:
///   flutter run  --dart-define=FLAVOR=dev
///   flutter build apk --dart-define=FLAVOR=prod --release
///
/// Android emulator: 10.0.2.2 maps to host machine localhost.
/// iOS Simulator:    localhost works directly.
library;

enum AppFlavor { dev, staging, prod }

class AppConfig {
  // Singleton — call AppConfig.init() once in main_*.dart before runApp().
  static late AppConfig current;

  final AppFlavor flavor;
  final String baseUrl;
  final String wsBaseUrl;

  // Feature flags — disabled by default in dev to surface backend errors clearly.
  final bool enableMeshRelay;
  final bool enableVoiceSos;

  AppConfig._({
    required this.flavor,
    required this.baseUrl,
    required this.wsBaseUrl,
    this.enableMeshRelay = false,
    this.enableVoiceSos = false,
  });

  static void init([String flavorStr = 'dev']) {
    final flavor = AppFlavor.values.byName(flavorStr.toLowerCase());
    current = switch (flavor) {
      AppFlavor.prod => AppConfig._(
          flavor: AppFlavor.prod,
          baseUrl: 'https://api.roadsos.io',
          wsBaseUrl: 'wss://api.roadsos.io',
          enableMeshRelay: true,
          enableVoiceSos: true,
        ),
      AppFlavor.staging => AppConfig._(
          flavor: AppFlavor.staging,
          baseUrl: 'https://staging.roadsos.io',
          wsBaseUrl: 'wss://staging.roadsos.io',
          enableMeshRelay: true,
          enableVoiceSos: true,
        ),
      AppFlavor.dev => AppConfig._(
          flavor: AppFlavor.dev,
          // Android emulator maps 10.0.2.2 → host localhost.
          // For real device on same network, use your machine's LAN IP instead.
          baseUrl: 'http://10.0.2.2:8000',
          wsBaseUrl: 'ws://10.0.2.2:8000',
        ),
    };
  }

  bool get isDev => flavor == AppFlavor.dev;
  bool get isStaging => flavor == AppFlavor.staging;
  bool get isProd => flavor == AppFlavor.prod;

  @override
  String toString() => 'AppConfig(flavor: $flavor, baseUrl: $baseUrl)';
}
