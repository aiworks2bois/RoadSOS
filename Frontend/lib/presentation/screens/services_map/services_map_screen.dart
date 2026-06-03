import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../domain/providers/core_providers.dart';

class ServicesMapScreen extends ConsumerStatefulWidget {
  const ServicesMapScreen({super.key});

  @override
  ConsumerState<ServicesMapScreen> createState() => _ServicesMapScreenState();
}

class _ServicesMapScreenState extends ConsumerState<ServicesMapScreen> {
  LatLng? _currentLocation;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    try {
      final locService = ref.read(locationServiceProvider);
      final position = await locService.getCurrentPosition();
      if (mounted) {
        setState(() {
          _currentLocation = LatLng(position.latitude, position.longitude);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Location Error: $_error', style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                    _error = null;
                  });
                  _fetchLocation();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Services Map'),
        backgroundColor: ColorTokens.bgSurface,
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: _currentLocation ?? const LatLng(0, 0),
          initialZoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.roadsos.app',
          ),
          MarkerLayer(
            markers: [
              if (_currentLocation != null)
                Marker(
                  point: _currentLocation!,
                  width: 60,
                  height: 60,
                  child: const Icon(
                    Icons.my_location,
                    color: ColorTokens.accentPrimary,
                    size: 40,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
