import 'package:coreinvent/data/remote_datasource/model/login_remote_entity.dart';
import 'package:coreinvent/data/remote_datasource/model/login_request_remote_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio, {String? baseUrl}) = _Api;

  @POST('/api/security/login')
  Future<LoginRemoteEntity> login(
    @Body() LoginRequestRemoteEntity body,
  );
}
