
import 'package:coreinvent/domain/model/login.dart';

class LoginEntity {
  final String token;

  LoginEntity({
    required this.token,
  });
}

extension LoginEntityExtension on LoginEntity {
  Login toLogin() => Login(
        token: token,
      );
}
