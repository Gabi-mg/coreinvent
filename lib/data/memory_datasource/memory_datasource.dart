

abstract class MemoryDataSourceContract {
  Future<String> getToken();

  Future<void> setToken(String token);
}

class MemoryDataSource implements MemoryDataSourceContract {
  MemoryDataSource();

  late String token;

  @override
  Future<String> getToken() async {
    return token;
  }

  @override
  Future<void> setToken(String token) async {
    this.token = token;
  }
}
