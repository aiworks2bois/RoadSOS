import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsos/app.dart';
import 'package:roadsos/core/config/app_config.dart';

void main() {
  testWidgets('App boots up smoke test', (WidgetTester tester) async {
    // Initialize configuration for testing
    AppConfig.init('dev');

    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: RoadSosApp()));

    // Verify that the app mounts successfully. We can look for the MaterialApp
    // or just let it finish pumping. The router will likely try to load a splash
    // or auth screen, so we just verify the widget tree is valid.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
