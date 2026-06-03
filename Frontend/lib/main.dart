import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/config/app_config.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Flavor check
  const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  AppConfig.init(flavor);

  // Future MVP: Init Firebase here, Init Drift here if needed beforehand
  
  runApp(
    const ProviderScope(
      child: RoadSosApp(),
    ),
  );
}

