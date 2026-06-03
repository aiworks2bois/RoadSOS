import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/config/app_config.dart';
import 'app.dart';

/// Development entry point.
/// Run: flutter run --dart-define=FLAVOR=dev
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.init('dev');
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: RoadSosApp()));
}
