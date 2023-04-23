import 'package:coreinvent/data/repository/model/login_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_remote_entity.freezed.dart';
part 'login_remote_entity.g.dart';

@freezed
class LoginRemoteEntity with _$LoginRemoteEntity {
  factory LoginRemoteEntity({
    required bool success,
    required int code,
    required String locale,
    required Data data,
  }) = _LoginRemoteEntity;

  factory LoginRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginRemoteEntityFromJson(json);
}

@freezed
class Data with _$Data {
  factory Data({
    required Login login,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Login with _$Login {
  factory Login({
    required String token,
    required String refreshToken,
    required int expiration,
    @JsonKey(name: 'expired_at') required DateTime expirationAt,
  }) = _Login;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
}

// @freezed
// class User with _$User {
//   factory User({
//     required String id,
//     required String type,
//
//   }) = _User;
//
//   // required Attributes attributes,
//   // required Meta meta,
//
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
// }

// @freezed
// class Attributes with _$Attributes {
//   factory Attributes({
//     required String name,
//     required String mail,
//     required bool authorizedToUpdate,
//     required bool authorizedToDelete,
//   }) = _Attributes;
//
//   factory Attributes.fromJson(Map<String, dynamic> json) => _$AttributesFromJson(json);
// }

// @freezed
// class Meta with _$Meta {
//   factory Meta({
//     required bool authorizedToShow,
//     required bool authorizedToStore,
//     required bool authorizedToUpdate,
//     required bool authorizedToDelete,
//   }) = _Meta;
//
//   factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
// }

extension LoginRemoteEntityExtension on LoginRemoteEntity {
  LoginEntity toLoginEntity() => LoginEntity(token: data.login.token);
}
