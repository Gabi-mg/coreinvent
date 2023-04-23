import 'package:coreinvent/core/network/result.dart';
import 'package:coreinvent/data/memory_datasource/memory_datasource.dart';
import 'package:coreinvent/data/remote_datasource/remote_datasource.dart';
import 'package:coreinvent/data/repository/model/login_entity.dart';
import 'package:coreinvent/domain/model/login.dart';
import 'package:coreinvent/domain/repository/repository.dart';

class Repository implements RepositoryContract {
  final RemoteDataSourceContract remoteDataSource;
  final MemoryDataSourceContract memoryDataSource;

  Repository({
    required this.remoteDataSource,
    required this.memoryDataSource,
  });

  @override
  Future<Result<Login>> login(
    String user,
    String password,
  ) async {
    try {
      final result = await remoteDataSource.login(
        user,
        password,
      );
      return Result.success(result.toLogin());
    } catch (error) {
      return Result.failure(error: error.toString());
    }
  }

  @override
  Future<Result<String>> getToken() async {
    try {
      final result = await memoryDataSource.getToken();
      return Result.success(result);
    } catch (error) {
      return Result.failure(error: error.toString());
    }
  }

  @override
  Future<void> setToken(String token) async {
    await memoryDataSource.setToken(token);
  }
}
