import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/volunteer_models.dart';

part 'volunteer_api.g.dart';

@RestApi()
abstract class VolunteerApi {
  factory VolunteerApi(Dio dio, {String baseUrl}) = _VolunteerApi;

  // ── Volunteer Profile ──────────────────────────────────────────────────────
  @POST('/volunteers/me')
  Future<VolunteerProfile> createOrUpdateProfile(@Body() VolunteerCreate payload);

  @POST('/volunteers/toggle-availability')
  Future<dynamic> toggleAvailability(@Query('available') bool available);

  // ── Incident Response ──────────────────────────────────────────────────────
  @POST('/volunteers/incidents/{incident_id}/respond')
  Future<VolunteerRespondResult> respondToIncident(
    @Path('incident_id') String incidentId,
    @Body() VolunteerRespondPayload payload,
  );

  // ── Dispatcher Dashboard ───────────────────────────────────────────────────
  @GET('/dashboard/incidents/active')
  Future<List<DashboardIncident>> getActiveIncidents(
    @Query('limit') int limit,
  );

  @GET('/dashboard/metrics')
  Future<DashboardMetrics> getMetrics(
    @Query('window_hours') int windowHours,
  );
}
