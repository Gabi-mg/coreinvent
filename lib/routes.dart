import 'package:coreinvent/ui/screens/home/page/home_page.dart';
import 'package:coreinvent/ui/screens/login/page/login_page.dart';
import 'package:go_router/go_router.dart';

class RoutePath {
  static String login() => '/';

  static String home() => '/home';
}

List<GoRoute> allAppRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginPage(),
    routes: [
      GoRoute(
        path: 'home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  )
];
