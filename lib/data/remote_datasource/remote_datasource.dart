import 'package:coreinvent/data/remote_datasource/api/api.dart';
import 'package:coreinvent/data/remote_datasource/model/login_remote_entity.dart';
import 'package:coreinvent/data/remote_datasource/model/login_request_remote_entity.dart';
import 'package:coreinvent/data/repository/model/login_entity.dart';

abstract class RemoteDataSourceContract {
  Future<LoginEntity> login(String email, String password);
}

class RemoteDataSource implements RemoteDataSourceContract {
  final Api api;

  RemoteDataSource({required this.api});

  @override
  Future<LoginEntity> login(String email, String password) async {
    final login = LoginRequestRemoteEntity(email: email, password: password);
    final result = await api.login(login);
    return result.toLoginEntity();
  }
}
