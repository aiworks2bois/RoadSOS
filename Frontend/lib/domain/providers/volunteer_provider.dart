import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/remote/models/volunteer_models.dart';
import '../providers/core_providers.dart';

// ── Volunteer State ───────────────────────────────────────────────────────────

class VolunteerState {
  final VolunteerProfile? profile;
  final bool isLoading;
  final String? error;
  final bool? lastToggleResult;

  const VolunteerState({
    this.profile,
    this.isLoading = false,
    this.error,
    this.lastToggleResult,
  });

  VolunteerState copyWith({
    VolunteerProfile? profile,
    bool? isLoading,
    String? error,
    bool? lastToggleResult,
    bool clearError = false,
  }) =>
      VolunteerState(
        profile: profile ?? this.profile,
        isLoading: isLoading ?? this.isLoading,
        error: clearError ? null : (error ?? this.error),
        lastToggleResult: lastToggleResult ?? this.lastToggleResult,
      );
}

class VolunteerNotifier extends Notifier<VolunteerState> {
  @override
  VolunteerState build() => const VolunteerState();

  Future<void> toggleAvailability(bool available) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final repo = ref.read(volunteerRepositoryProvider);
      final result = await repo.toggleAvailability(available);
      state = state.copyWith(isLoading: false, lastToggleResult: result);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Alias for toggle — used by Profile screen.
  Future<void> setAvailability(bool available) => toggleAvailability(available);

  /// Register as a volunteer (first-time or update).
  Future<void> register({required String name, required String phone, double lat = 0.0, double lng = 0.0}) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final repo = ref.read(volunteerRepositoryProvider);
      final profile = await repo.createOrUpdateProfile(
        VolunteerCreate(name: name, phone: phone, lat: lat, lng: lng, available: true),
      );
      state = state.copyWith(isLoading: false, profile: profile);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<VolunteerRespondResult?> respond(
    String incidentId, {
    required String action,
    String? note,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final repo = ref.read(volunteerRepositoryProvider);
      final result = await repo.respondToIncident(incidentId, action: action, note: note);
      state = state.copyWith(isLoading: false);
      return result;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return null;
    }
  }
}

final volunteerNotifierProvider =
    NotifierProvider<VolunteerNotifier, VolunteerState>(() => VolunteerNotifier());

// ── Dispatcher Providers ──────────────────────────────────────────────────────

final activeIncidentsProvider =
    FutureProvider.autoDispose<List<DashboardIncident>>((ref) async {
  final repo = ref.watch(volunteerRepositoryProvider);
  return repo.getActiveIncidents(limit: 100);
});

final dashboardMetricsProvider =
    FutureProvider.autoDispose<DashboardMetrics>((ref) async {
  final repo = ref.watch(volunteerRepositoryProvider);
  return repo.getMetrics(windowHours: 24);
});
