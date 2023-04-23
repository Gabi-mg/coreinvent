import 'package:coreinvent/core/network/result.dart';
import 'package:coreinvent/domain/model/login.dart';

abstract class RepositoryContract {
  Future<Result<Login>> login(String user, String password);

  Future<Result<String>> getToken();

  Future<void> setToken(String token);
}
