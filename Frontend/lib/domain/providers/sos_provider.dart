import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/remote/models/sos_models.dart';
import 'core_providers.dart';

class SosState {
  final bool isTriggering;
  final String? error;
  final SosResponse? activeSos;
  final IncidentModel? currentIncident;

  const SosState({
    this.isTriggering = false,
    this.error,
    this.activeSos,
    this.currentIncident,
  });

  SosState copyWith({
    bool? isTriggering,
    String? error,
    SosResponse? activeSos,
    IncidentModel? currentIncident,
    bool clearError = false,
  }) {
    return SosState(
      isTriggering: isTriggering ?? this.isTriggering,
      error: clearError ? null : (error ?? this.error),
      activeSos: activeSos ?? this.activeSos,
      currentIncident: currentIncident ?? this.currentIncident,
    );
  }
}

class SosNotifier extends Notifier<SosState> {
  @override
  SosState build() {
    return const SosState();
  }

  Future<void> triggerSos({
    double? lat,
    double? lng,
    String description = 'Emergency SOS triggered',
    bool silent = false,
    bool bystanderMode = false,
    String? victimName,
    String? victimPhone,
  }) async {
    state = state.copyWith(isTriggering: true, clearError: true);
    try {
      if (lat == null || lng == null) {
        final locService = ref.read(locationServiceProvider);
        final position = await locService.getCurrentPosition();
        lat = position.latitude;
        lng = position.longitude;
      }

      final repo = ref.read(sosRepositoryProvider);
      final response = await repo.triggerSos(SosTriggerRequest(
        description: description,
        lat: lat,
        lng: lng,
        silent: silent,
        bystanderMode: bystanderMode,
        victimName: victimName,
        victimPhone: victimPhone,
      ));
      state = state.copyWith(
        isTriggering: false,
        activeSos: response,
      );
      // Fetch full incident details immediately after
      fetchIncident(response.incidentId);
    } catch (e) {
      state = state.copyWith(isTriggering: false, error: e.toString());
    }
  }

  Future<void> fetchIncident(String incidentId) async {
    try {
      final repo = ref.read(sosRepositoryProvider);
      final incident = await repo.getIncident(incidentId);
      state = state.copyWith(currentIncident: incident);
    } catch (e) {
      // Background fail, maybe log it
    }
  }

  void clearSos() {
    state = const SosState();
  }
}

final sosNotifierProvider = NotifierProvider<SosNotifier, SosState>(() {
  return SosNotifier();
});

final emergencyBundleProvider = FutureProvider.family<EmergencyBundle?, String>((ref, incidentId) async {
  final repo = ref.watch(sosRepositoryProvider);
  final location = ref.watch(locationServiceProvider);
  final position = await location.getCurrentPosition();
  
  return repo.getEmergencyBundle(SosTriggerRequest(
    description: 'Golden hour refresh',
    source: 'APP',
    lat: position.latitude,
    lng: position.longitude,
  ));
});
