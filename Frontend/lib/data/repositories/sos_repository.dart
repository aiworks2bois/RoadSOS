import 'dart:convert';
import '../../core/network/dio_client.dart';
import '../../core/offline/offline_queue.dart';
import '../local/database.dart';
import '../remote/api/sos_api.dart';
import '../remote/models/sos_models.dart';

class SosRepository {
  final SosApi _api;
  final OfflineQueue _offlineQueue;
  final AppDatabase _db;

  SosRepository(this._api, this._offlineQueue, this._db);

  /// Trigger an SOS. If offline, queues the request and returns a simulated response.
  Future<SosResponse> triggerSos(SosTriggerRequest request) async {
    try {
      return await _api.triggerSos(request);
    } on OfflineException {
      await _offlineQueue.enqueue(request.toJson());
      // Return a simulated response for the UI.
      return SosResponse(
        incidentId: 'offline_${DateTime.now().millisecondsSinceEpoch}',
        priority: 'PENDING',
        triageConfidence: 1.0,
        estimatedResponseTime: 'Queued - Waiting for connection',
      );
    }
  }

  /// Get the Golden Hour bundle for an incident
  Future<EmergencyBundle> getEmergencyBundle(SosTriggerRequest request) async {
    return await _api.triggerBundle(request);
  }

  /// Get incident details. Uses local Drift cache if offline.
  Future<IncidentModel?> getIncident(String id) async {
    try {
      final incident = await _api.getIncident(id);
      // Cache it
      await _db.into(_db.incidentCaches).insertOnConflictUpdate(
        IncidentCache(
          id: id,
          payloadJson: jsonEncode(incident.toJson()),
          cachedAt: DateTime.now(),
        ),
      );
      return incident;
    } on OfflineException {
      // Load from cache
      final cached = await (_db.select(_db.incidentCaches)..where((t) => t.id.equals(id))).getSingleOrNull();
      if (cached != null) {
        return IncidentModel.fromJson(jsonDecode(cached.payloadJson));
      }
      return null;
    }
  }

  Future<void> updateLiveLocation(String incidentId, double lat, double lng, {int? batteryPercent}) async {
    try {
      await _api.updateLiveLocation(
        incidentId,
        LiveLocationUpdate(
          incidentId: incidentId,
          lat: lat,
          lng: lng,
          batteryPercent: batteryPercent,
        ),
      );
    } on OfflineException {
      // Location updates are fire-and-forget in MVP; we don't queue them to save battery/storage.
    }
  }

  /// Attempt to drain the offline queue to the bundle endpoint.
  Future<void> drainOfflineQueue() async {
    if (_offlineQueue.isEmpty) return;

    final items = _offlineQueue.pending;
    for (final item in items) {
      try {
        await _api.triggerBundle(SosTriggerRequest.fromJson(item.payload));
        await _offlineQueue.dequeue(item.id);
      } catch (e) {
        // If it fails (even 4xx/5xx), we leave it in the queue for the next retry,
        // or we could implement a DLQ. For MVP, we just break and try later.
        break;
      }
    }
  }
}
