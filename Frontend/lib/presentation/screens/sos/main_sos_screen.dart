import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../domain/providers/sos_provider.dart';

class SosTriggerScreen extends ConsumerWidget {
  const SosTriggerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sosState = ref.watch(sosNotifierProvider);

    return Scaffold(
      backgroundColor: ColorTokens.bgSurface,
      appBar: AppBar(
        title: const Text('Emergency SOS'),
        backgroundColor: ColorTokens.bgSurface,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (sosState.activeSos != null) ...[
              const Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 16),
              Text(
                sosState.activeSos!.message,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text('ETA: ${sosState.activeSos!.estimatedResponseTime}'),
            ] else ...[
              GestureDetector(
                onTap: sosState.isTriggering
                    ? null
                    : () {
                        ref.read(sosNotifierProvider.notifier).triggerSos();
                      },
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: ColorTokens.severityCritical,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: ColorTokens.severityCritical.withValues(alpha: 0.4),
                        blurRadius: 30,
                        spreadRadius: 10,
                      )
                    ],
                  ),
                  child: Center(
                    child: sosState.isTriggering
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'SOS',
                            style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              const Text(
                'Tap for 3 seconds in emergency',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
            if (sosState.error != null) ...[
              const SizedBox(height: 24),
              Text(
                'Error: ${sosState.error}',
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
