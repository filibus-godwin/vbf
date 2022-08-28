import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:victorbellofoundation/app_navigator/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return MaterialApp.router(
      routeInformationParser: AppRouteParser(),
      routerDelegate: AppRouter(),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark().copyWith(),
        textTheme: GoogleFonts.montserratTextTheme(textTheme),
      ),
    );
  }
}
