import 'package:flutter/material.dart';
import 'package:victorbellofoundation/app_navigator/router.dart';
import 'package:victorbellofoundation/theme/theme.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: AppRouteParser(),
      routerDelegate: router,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.dark,
    );
  }
}
