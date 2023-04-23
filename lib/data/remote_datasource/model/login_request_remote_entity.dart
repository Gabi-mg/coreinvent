import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_remote_entity.freezed.dart';
part 'login_request_remote_entity.g.dart';

@freezed
class LoginRequestRemoteEntity with _$LoginRequestRemoteEntity {
  factory LoginRequestRemoteEntity({
    required String email,
    required String password,
  }) = _LoginRequestRemoteEntity;

  factory LoginRequestRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestRemoteEntityFromJson(json);
}
