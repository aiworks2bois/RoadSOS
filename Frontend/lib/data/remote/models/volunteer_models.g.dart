// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VolunteerProfile _$VolunteerProfileFromJson(Map<String, dynamic> json) =>
    _VolunteerProfile(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      available: json['available'] as bool? ?? true,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VolunteerProfileToJson(_VolunteerProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'phone': instance.phone,
      'skills': instance.skills,
      'available': instance.available,
      'lat': instance.lat,
      'lng': instance.lng,
      'rating': instance.rating,
    };

_VolunteerCreate _$VolunteerCreateFromJson(Map<String, dynamic> json) =>
    _VolunteerCreate(
      name: json['name'] as String,
      phone: json['phone'] as String,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      available: json['available'] as bool? ?? true,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$VolunteerCreateToJson(_VolunteerCreate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'skills': instance.skills,
      'available': instance.available,
      'lat': instance.lat,
      'lng': instance.lng,
    };

_VolunteerRespondPayload _$VolunteerRespondPayloadFromJson(
        Map<String, dynamic> json) =>
    _VolunteerRespondPayload(
      action: json['action'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$VolunteerRespondPayloadToJson(
        _VolunteerRespondPayload instance) =>
    <String, dynamic>{
      'action': instance.action,
      'note': instance.note,
    };

_VolunteerRespondResult _$VolunteerRespondResultFromJson(
        Map<String, dynamic> json) =>
    _VolunteerRespondResult(
      status: json['status'] as String,
      incidentId: json['incident_id'] as String,
      volunteerId: json['volunteer_id'] as String,
      incidentStatus: json['incident_status'] as String,
    );

Map<String, dynamic> _$VolunteerRespondResultToJson(
        _VolunteerRespondResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'incident_id': instance.incidentId,
      'volunteer_id': instance.volunteerId,
      'incident_status': instance.incidentStatus,
    };

_DashboardIncident _$DashboardIncidentFromJson(Map<String, dynamic> json) =>
    _DashboardIncident(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      priority: json['priority'] as String,
      status: json['status'] as String,
      source: json['source'] as String,
      silent: json['silent'] as bool? ?? false,
      bystanderMode: json['bystander_mode'] as bool? ?? false,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      descriptionPreview: json['description_preview'] as String?,
      createdAt: json['created_at'] as String,
      ageSeconds: (json['age_seconds'] as num).toInt(),
      notificationsSent: (json['notifications_sent'] as num?)?.toInt() ?? 0,
      feedbackRating: (json['feedback_rating'] as num?)?.toDouble(),
      isMci: json['is_mci'] as bool? ?? false,
      clusterId: json['cluster_id'] as String?,
    );

Map<String, dynamic> _$DashboardIncidentToJson(_DashboardIncident instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'priority': instance.priority,
      'status': instance.status,
      'source': instance.source,
      'silent': instance.silent,
      'bystander_mode': instance.bystanderMode,
      'lat': instance.lat,
      'lng': instance.lng,
      'description_preview': instance.descriptionPreview,
      'created_at': instance.createdAt,
      'age_seconds': instance.ageSeconds,
      'notifications_sent': instance.notificationsSent,
      'feedback_rating': instance.feedbackRating,
      'is_mci': instance.isMci,
      'cluster_id': instance.clusterId,
    };

_DashboardMetrics _$DashboardMetricsFromJson(Map<String, dynamic> json) =>
    _DashboardMetrics(
      windowHours: (json['window_hours'] as num).toInt(),
      activeIncidents: (json['active_incidents'] as num?)?.toInt() ?? 0,
      escalatedIncidents: (json['escalated_incidents'] as num?)?.toInt() ?? 0,
      resolvedIncidents: (json['resolved_incidents'] as num?)?.toInt() ?? 0,
      cancelledIncidents: (json['cancelled_incidents'] as num?)?.toInt() ?? 0,
      avgResolutionSeconds:
          (json['avg_resolution_seconds'] as num?)?.toDouble(),
      avgFeedbackRating: (json['avg_feedback_rating'] as num?)?.toDouble(),
      incidentsByPriority:
          (json['incidents_by_priority'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toInt()),
              ) ??
              const {},
      notificationsByChannel:
          (json['notifications_by_channel'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toInt()),
              ) ??
              const {},
    );

Map<String, dynamic> _$DashboardMetricsToJson(_DashboardMetrics instance) =>
    <String, dynamic>{
      'window_hours': instance.windowHours,
      'active_incidents': instance.activeIncidents,
      'escalated_incidents': instance.escalatedIncidents,
      'resolved_incidents': instance.resolvedIncidents,
      'cancelled_incidents': instance.cancelledIncidents,
      'avg_resolution_seconds': instance.avgResolutionSeconds,
      'avg_feedback_rating': instance.avgFeedbackRating,
      'incidents_by_priority': instance.incidentsByPriority,
      'notifications_by_channel': instance.notificationsByChannel,
    };
