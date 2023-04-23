import 'package:coreinvent/core/scheme/color_schemes.dart';
import 'package:coreinvent/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:coreinvent/di/app_di.dart' as di;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  await di.init();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final GoRouter _router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: allAppRoutes,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', ''), //Spanish
        Locale('en', ''), //English
      ],
      title: 'Coreinvent',
    );
  }
}
