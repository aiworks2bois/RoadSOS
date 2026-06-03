// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sos_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationPayload _$LocationPayloadFromJson(Map<String, dynamic> json) =>
    _LocationPayload(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      accuracyM: (json['accuracy_m'] as num?)?.toDouble(),
      speedMps: (json['speed_mps'] as num?)?.toDouble(),
      headingDeg: (json['heading_deg'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationPayloadToJson(_LocationPayload instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'accuracy_m': instance.accuracyM,
      'speed_mps': instance.speedMps,
      'heading_deg': instance.headingDeg,
    };

_SosTriggerRequest _$SosTriggerRequestFromJson(Map<String, dynamic> json) =>
    _SosTriggerRequest(
      description: json['description'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      impactForce: (json['impact_force'] as num?)?.toDouble(),
      source: json['source'] as String? ?? 'manual',
      silent: json['silent'] as bool? ?? false,
      bystanderMode: json['bystander_mode'] as bool? ?? false,
      victimName: json['victim_name'] as String?,
      victimPhone: json['victim_phone'] as String?,
      sensorPayload:
          json['sensor_payload'] as Map<String, dynamic>? ?? const {},
      clientReferenceId: json['client_reference_id'] as String?,
    );

Map<String, dynamic> _$SosTriggerRequestToJson(_SosTriggerRequest instance) =>
    <String, dynamic>{
      'description': instance.description,
      'lat': instance.lat,
      'lng': instance.lng,
      'impact_force': instance.impactForce,
      'source': instance.source,
      'silent': instance.silent,
      'bystander_mode': instance.bystanderMode,
      'victim_name': instance.victimName,
      'victim_phone': instance.victimPhone,
      'sensor_payload': instance.sensorPayload,
      'client_reference_id': instance.clientReferenceId,
    };

_SosResponse _$SosResponseFromJson(Map<String, dynamic> json) => _SosResponse(
      incidentId: json['incident_id'] as String,
      priority: json['priority'] as String,
      triageConfidence: (json['triage_confidence'] as num).toDouble(),
      volunteersNotified: (json['volunteers_notified'] as num?)?.toInt() ?? 0,
      servicesNotified: (json['services_notified'] as num?)?.toInt() ?? 0,
      estimatedResponseTime: json['estimated_response_time'] as String,
      message: json['message'] as String? ??
          "SOS received. Help dispatch has started.",
    );

Map<String, dynamic> _$SosResponseToJson(_SosResponse instance) =>
    <String, dynamic>{
      'incident_id': instance.incidentId,
      'priority': instance.priority,
      'triage_confidence': instance.triageConfidence,
      'volunteers_notified': instance.volunteersNotified,
      'services_notified': instance.servicesNotified,
      'estimated_response_time': instance.estimatedResponseTime,
      'message': instance.message,
    };

_IncidentModel _$IncidentModelFromJson(Map<String, dynamic> json) =>
    _IncidentModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      description: json['description'] as String,
      priority: json['priority'] as String,
      triageConfidence: (json['triage_confidence'] as num).toDouble(),
      source: json['source'] as String,
      silent: json['silent'] as bool,
      bystanderMode: json['bystander_mode'] as bool,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      status: json['status'] as String,
      clusterId: json['cluster_id'] as String?,
      isMci: json['is_mci'] as bool? ?? false,
      isMciCoordinator: json['is_mci_coordinator'] as bool? ?? false,
      acceptedResponderId: json['accepted_responder_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      resolvedAt: json['resolved_at'] == null
          ? null
          : DateTime.parse(json['resolved_at'] as String),
    );

Map<String, dynamic> _$IncidentModelToJson(_IncidentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'description': instance.description,
      'priority': instance.priority,
      'triage_confidence': instance.triageConfidence,
      'source': instance.source,
      'silent': instance.silent,
      'bystander_mode': instance.bystanderMode,
      'lat': instance.lat,
      'lng': instance.lng,
      'status': instance.status,
      'cluster_id': instance.clusterId,
      'is_mci': instance.isMci,
      'is_mci_coordinator': instance.isMciCoordinator,
      'accepted_responder_id': instance.acceptedResponderId,
      'created_at': instance.createdAt.toIso8601String(),
      'resolved_at': instance.resolvedAt?.toIso8601String(),
    };

_IncidentStatusUpdate _$IncidentStatusUpdateFromJson(
        Map<String, dynamic> json) =>
    _IncidentStatusUpdate(
      status: json['status'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$IncidentStatusUpdateToJson(
        _IncidentStatusUpdate instance) =>
    <String, dynamic>{
      'status': instance.status,
      'note': instance.note,
    };

_LiveLocationUpdate _$LiveLocationUpdateFromJson(Map<String, dynamic> json) =>
    _LiveLocationUpdate(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      accuracyM: (json['accuracy_m'] as num?)?.toDouble(),
      speedMps: (json['speed_mps'] as num?)?.toDouble(),
      headingDeg: (json['heading_deg'] as num?)?.toDouble(),
      incidentId: json['incident_id'] as String,
      batteryPercent: (json['battery_percent'] as num?)?.toInt(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$LiveLocationUpdateToJson(_LiveLocationUpdate instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'accuracy_m': instance.accuracyM,
      'speed_mps': instance.speedMps,
      'heading_deg': instance.headingDeg,
      'incident_id': instance.incidentId,
      'battery_percent': instance.batteryPercent,
      'timestamp': instance.timestamp?.toIso8601String(),
    };

_OfflineServicesResponse _$OfflineServicesResponseFromJson(
        Map<String, dynamic> json) =>
    _OfflineServicesResponse(
      geohash: json['geohash'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      ttlSeconds: (json['ttl_seconds'] as num?)?.toInt() ?? 86400,
    );

Map<String, dynamic> _$OfflineServicesResponseToJson(
        _OfflineServicesResponse instance) =>
    <String, dynamic>{
      'geohash': instance.geohash,
      'services': instance.services,
      'ttl_seconds': instance.ttlSeconds,
    };

_NearbyService _$NearbyServiceFromJson(Map<String, dynamic> json) =>
    _NearbyService(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      distanceKm: (json['distance_km'] as num).toDouble(),
      trustScore: (json['trust_score'] as num).toDouble(),
      explainableTrust: json['explainable_trust'] as String,
      phone: json['phone'] as String?,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$NearbyServiceToJson(_NearbyService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'distance_km': instance.distanceKm,
      'trust_score': instance.trustScore,
      'explainable_trust': instance.explainableTrust,
      'phone': instance.phone,
      'lat': instance.lat,
      'lng': instance.lng,
    };

_EmergencyBundle _$EmergencyBundleFromJson(Map<String, dynamic> json) =>
    _EmergencyBundle(
      incidentId: json['incident_id'] as String,
      severity: json['severity'] as String,
      confidenceScore: (json['confidence_overall'] as num).toDouble(),
      goldenHourRisk: (json['golden_hour_risk_index'] as num).toDouble(),
      actionPlan: (json['recommended_action_plan'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      medicalServices: (json['medical'] as List<dynamic>)
          .map((e) => NearbyService.fromJson(e as Map<String, dynamic>))
          .toList(),
      safetyServices: (json['safety'] as List<dynamic>)
          .map((e) => NearbyService.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicleServices: (json['vehicle'] as List<dynamic>)
          .map((e) => NearbyService.fromJson(e as Map<String, dynamic>))
          .toList(),
      offlinePayload: json['offline_payload'] as Map<String, dynamic>?,
      countryFallbacks:
          (json['country_fallback'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$EmergencyBundleToJson(_EmergencyBundle instance) =>
    <String, dynamic>{
      'incident_id': instance.incidentId,
      'severity': instance.severity,
      'confidence_overall': instance.confidenceScore,
      'golden_hour_risk_index': instance.goldenHourRisk,
      'recommended_action_plan': instance.actionPlan,
      'medical': instance.medicalServices,
      'safety': instance.safetyServices,
      'vehicle': instance.vehicleServices,
      'offline_payload': instance.offlinePayload,
      'country_fallback': instance.countryFallbacks,
    };
