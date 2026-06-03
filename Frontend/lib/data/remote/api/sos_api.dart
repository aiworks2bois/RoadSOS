import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/sos_models.dart';

part 'sos_api.g.dart';

@RestApi()
abstract class SosApi {
  factory SosApi(Dio dio, {String baseUrl}) = _SosApi;

  @POST('/sos/trigger')
  Future<SosResponse> triggerSos(@Body() SosTriggerRequest request);

  @POST('/emergency/bundle')
  Future<EmergencyBundle> triggerBundle(@Body() SosTriggerRequest request);

  @GET('/sos/incidents/{incident_id}')
  Future<IncidentModel> getIncident(@Path('incident_id') String incidentId);

  @PATCH('/sos/incidents/{incident_id}/status')
  Future<IncidentModel> updateIncidentStatus(
    @Path('incident_id') String incidentId,
    @Body() IncidentStatusUpdate request,
  );

  @POST('/sos/incidents/{incident_id}/location')
  Future<void> updateLiveLocation(
    @Path('incident_id') String incidentId,
    @Body() LiveLocationUpdate request,
  );

  @GET('/sos/offline-services')
  Future<OfflineServicesResponse> getOfflineServices(
    @Query('lat') double lat,
    @Query('lng') double lng,
  );
}
