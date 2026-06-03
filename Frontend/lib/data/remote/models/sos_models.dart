import 'package:freezed_annotation/freezed_annotation.dart';

part 'sos_models.freezed.dart';
part 'sos_models.g.dart';

@freezed
abstract class LocationPayload with _$LocationPayload {
  const factory LocationPayload({
    required double lat,
    required double lng,
    @JsonKey(name: 'accuracy_m') double? accuracyM,
    @JsonKey(name: 'speed_mps') double? speedMps,
    @JsonKey(name: 'heading_deg') double? headingDeg,
  }) = _LocationPayload;

  factory LocationPayload.fromJson(Map<String, dynamic> json) => _$LocationPayloadFromJson(json);
}

@freezed
abstract class SosTriggerRequest with _$SosTriggerRequest {
  const factory SosTriggerRequest({
    required String description,
    required double lat,
    required double lng,
    @JsonKey(name: 'impact_force') double? impactForce,
    @Default('manual') String source,
    @Default(false) bool silent,
    @JsonKey(name: 'bystander_mode') @Default(false) bool bystanderMode,
    @JsonKey(name: 'victim_name') String? victimName,
    @JsonKey(name: 'victim_phone') String? victimPhone,
    @JsonKey(name: 'sensor_payload') @Default({}) Map<String, dynamic> sensorPayload,
    @JsonKey(name: 'client_reference_id') String? clientReferenceId,
  }) = _SosTriggerRequest;

  factory SosTriggerRequest.fromJson(Map<String, dynamic> json) => _$SosTriggerRequestFromJson(json);
}

@freezed
abstract class SosResponse with _$SosResponse {
  const factory SosResponse({
    @JsonKey(name: 'incident_id') required String incidentId,
    required String priority,
    @JsonKey(name: 'triage_confidence') required double triageConfidence,
    @JsonKey(name: 'volunteers_notified') @Default(0) int volunteersNotified,
    @JsonKey(name: 'services_notified') @Default(0) int servicesNotified,
    @JsonKey(name: 'estimated_response_time') required String estimatedResponseTime,
    @Default("SOS received. Help dispatch has started.") String message,
  }) = _SosResponse;

  factory SosResponse.fromJson(Map<String, dynamic> json) => _$SosResponseFromJson(json);
}

@freezed
abstract class IncidentModel with _$IncidentModel {
  const factory IncidentModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String description,
    required String priority,
    @JsonKey(name: 'triage_confidence') required double triageConfidence,
    required String source,
    required bool silent,
    @JsonKey(name: 'bystander_mode') required bool bystanderMode,
    required double lat,
    required double lng,
    required String status,
    @JsonKey(name: 'cluster_id') String? clusterId,
    @JsonKey(name: 'is_mci') @Default(false) bool isMci,
    @JsonKey(name: 'is_mci_coordinator') @Default(false) bool isMciCoordinator,
    @JsonKey(name: 'accepted_responder_id') String? acceptedResponderId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'resolved_at') DateTime? resolvedAt,
  }) = _IncidentModel;

  factory IncidentModel.fromJson(Map<String, dynamic> json) => _$IncidentModelFromJson(json);
}

@freezed
abstract class IncidentStatusUpdate with _$IncidentStatusUpdate {
  const factory IncidentStatusUpdate({
    required String status,
    String? note,
  }) = _IncidentStatusUpdate;

  factory IncidentStatusUpdate.fromJson(Map<String, dynamic> json) => _$IncidentStatusUpdateFromJson(json);
}

@freezed
abstract class LiveLocationUpdate with _$LiveLocationUpdate {
  const factory LiveLocationUpdate({
    required double lat,
    required double lng,
    @JsonKey(name: 'accuracy_m') double? accuracyM,
    @JsonKey(name: 'speed_mps') double? speedMps,
    @JsonKey(name: 'heading_deg') double? headingDeg,
    @JsonKey(name: 'incident_id') required String incidentId,
    @JsonKey(name: 'battery_percent') int? batteryPercent,
    DateTime? timestamp,
  }) = _LiveLocationUpdate;

  factory LiveLocationUpdate.fromJson(Map<String, dynamic> json) => _$LiveLocationUpdateFromJson(json);
}

@freezed
abstract class OfflineServicesResponse with _$OfflineServicesResponse {
  const factory OfflineServicesResponse({
    required String geohash,
    required List<Map<String, dynamic>> services,
    @JsonKey(name: 'ttl_seconds') @Default(86400) int ttlSeconds,
  }) = _OfflineServicesResponse;

  factory OfflineServicesResponse.fromJson(Map<String, dynamic> json) => _$OfflineServicesResponseFromJson(json);
}

@freezed
abstract class NearbyService with _$NearbyService {
  const factory NearbyService({
    required String id,
    required String name,
    required String type,
    @JsonKey(name: 'distance_km') required double distanceKm,
    @JsonKey(name: 'trust_score') required double trustScore,
    @JsonKey(name: 'explainable_trust') required String explainableTrust,
    String? phone,
    required double lat,
    required double lng,
  }) = _NearbyService;

  factory NearbyService.fromJson(Map<String, dynamic> json) => _$NearbyServiceFromJson(json);
}

@freezed
abstract class EmergencyBundle with _$EmergencyBundle {
  const factory EmergencyBundle({
    @JsonKey(name: 'incident_id') required String incidentId,
    required String severity,
    @JsonKey(name: 'confidence_overall') required double confidenceScore,
    @JsonKey(name: 'golden_hour_risk_index') required double goldenHourRisk,
    @JsonKey(name: 'recommended_action_plan') required List<Map<String, dynamic>> actionPlan,
    @JsonKey(name: 'medical') required List<NearbyService> medicalServices,
    @JsonKey(name: 'safety') required List<NearbyService> safetyServices,
    @JsonKey(name: 'vehicle') required List<NearbyService> vehicleServices,
    @JsonKey(name: 'offline_payload') Map<String, dynamic>? offlinePayload,
    @JsonKey(name: 'country_fallback') Map<String, String>? countryFallbacks,
  }) = _EmergencyBundle;

  factory EmergencyBundle.fromJson(Map<String, dynamic> json) => _$EmergencyBundleFromJson(json);
}
