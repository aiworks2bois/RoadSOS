import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteer_models.freezed.dart';
part 'volunteer_models.g.dart';

// ── Volunteer Profile ─────────────────────────────────────────────────────────

@freezed
abstract class VolunteerProfile with _$VolunteerProfile {
  const factory VolunteerProfile({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String name,
    required String phone,
    @Default([]) List<String> skills,
    @Default(true) bool available,
    double? lat,
    double? lng,
    double? rating,
  }) = _VolunteerProfile;

  factory VolunteerProfile.fromJson(Map<String, dynamic> json) =>
      _$VolunteerProfileFromJson(json);
}

@freezed
abstract class VolunteerCreate with _$VolunteerCreate {
  const factory VolunteerCreate({
    required String name,
    required String phone,
    @Default([]) List<String> skills,
    @Default(true) bool available,
    required double lat,
    required double lng,
  }) = _VolunteerCreate;

  factory VolunteerCreate.fromJson(Map<String, dynamic> json) =>
      _$VolunteerCreateFromJson(json);
}

@freezed
abstract class VolunteerRespondPayload with _$VolunteerRespondPayload {
  const factory VolunteerRespondPayload({
    required String action, // 'accept' | 'decline'
    String? note,
  }) = _VolunteerRespondPayload;

  factory VolunteerRespondPayload.fromJson(Map<String, dynamic> json) =>
      _$VolunteerRespondPayloadFromJson(json);
}

@freezed
abstract class VolunteerRespondResult with _$VolunteerRespondResult {
  const factory VolunteerRespondResult({
    required String status,
    @JsonKey(name: 'incident_id') required String incidentId,
    @JsonKey(name: 'volunteer_id') required String volunteerId,
    @JsonKey(name: 'incident_status') required String incidentStatus,
  }) = _VolunteerRespondResult;

  factory VolunteerRespondResult.fromJson(Map<String, dynamic> json) =>
      _$VolunteerRespondResultFromJson(json);
}

// ── Dispatcher / Dashboard ────────────────────────────────────────────────────

@freezed
abstract class DashboardIncident with _$DashboardIncident {
  const factory DashboardIncident({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String priority,
    required String status,
    required String source,
    @Default(false) bool silent,
    @JsonKey(name: 'bystander_mode') @Default(false) bool bystanderMode,
    required double lat,
    required double lng,
    @JsonKey(name: 'description_preview') String? descriptionPreview,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'age_seconds') required int ageSeconds,
    @JsonKey(name: 'notifications_sent') @Default(0) int notificationsSent,
    @JsonKey(name: 'feedback_rating') double? feedbackRating,
    @JsonKey(name: 'is_mci') @Default(false) bool isMci,
    @JsonKey(name: 'cluster_id') String? clusterId,
  }) = _DashboardIncident;

  factory DashboardIncident.fromJson(Map<String, dynamic> json) =>
      _$DashboardIncidentFromJson(json);
}

@freezed
abstract class DashboardMetrics with _$DashboardMetrics {
  const factory DashboardMetrics({
    @JsonKey(name: 'window_hours') required int windowHours,
    @JsonKey(name: 'active_incidents') @Default(0) int activeIncidents,
    @JsonKey(name: 'escalated_incidents') @Default(0) int escalatedIncidents,
    @JsonKey(name: 'resolved_incidents') @Default(0) int resolvedIncidents,
    @JsonKey(name: 'cancelled_incidents') @Default(0) int cancelledIncidents,
    @JsonKey(name: 'avg_resolution_seconds') double? avgResolutionSeconds,
    @JsonKey(name: 'avg_feedback_rating') double? avgFeedbackRating,
    @JsonKey(name: 'incidents_by_priority') @Default({}) Map<String, int> incidentsByPriority,
    @JsonKey(name: 'notifications_by_channel') @Default({}) Map<String, int> notificationsByChannel,
  }) = _DashboardMetrics;

  factory DashboardMetrics.fromJson(Map<String, dynamic> json) =>
      _$DashboardMetricsFromJson(json);
}
