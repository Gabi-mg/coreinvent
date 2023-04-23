import 'package:coreinvent/core/network/result.dart';
import 'package:coreinvent/domain/model/login.dart';
import 'package:coreinvent/domain/repository/repository.dart';

class LoginUsecase {
  final RepositoryContract _repository;

  LoginUsecase(this._repository);

  Future<Result<Login>> login(String user, String password) async {
    return _repository.login(user, password);
  }

  Future<Result<String>> getToken() async {
    return _repository.getToken();
  }

  Future<void> setToken(String token) async {
    return _repository.setToken(token);
  }
}
