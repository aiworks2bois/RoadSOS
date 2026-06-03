import '../remote/api/volunteer_api.dart';
import '../remote/models/volunteer_models.dart';

class VolunteerRepository {
  final VolunteerApi _api;

  VolunteerRepository(this._api);

  Future<VolunteerProfile> createOrUpdateProfile(VolunteerCreate payload) =>
      _api.createOrUpdateProfile(payload);

  Future<bool> toggleAvailability(bool available) async {
    final result = await _api.toggleAvailability(available) as Map<String, dynamic>?;
    return result?['available'] as bool? ?? available;
  }

  Future<VolunteerRespondResult> respondToIncident(
    String incidentId, {
    required String action,
    String? note,
  }) =>
      _api.respondToIncident(
        incidentId,
        VolunteerRespondPayload(action: action, note: note),
      );

  Future<List<DashboardIncident>> getActiveIncidents({int limit = 100}) =>
      _api.getActiveIncidents(limit);

  Future<DashboardMetrics> getMetrics({int windowHours = 24}) =>
      _api.getMetrics(windowHours);
}
