import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victorbellofoundation/app_navigator/bloc/app_navigator_bloc.dart';
import 'package:victorbellofoundation/app_navigator/path.dart';
import 'package:victorbellofoundation/home/view/home.dart';
import 'package:victorbellofoundation/login/view/view.dart';
import 'package:victorbellofoundation/otp/view/view.dart';
import 'package:victorbellofoundation/signup/view/view.dart';
import 'package:victorbellofoundation/splash/view/view.dart';

class NavigatorManager {
  static AppNavigatorBloc _withContext(BuildContext context) {
    return BlocProvider.of<AppNavigatorBloc>(context);
  }

  static goBack(BuildContext context) {
    _withContext(context).add(LastPagePopEvent());
  }

  static goToSplash(BuildContext context) {
    _withContext(context).add(
      PagePushEvent(
        MaterialPage(
          child: const SplashPage(),
          key: UniqueKey(),
          name: SplashPagePath.info.location,
        ),
      ),
    );
  }

  static goToLogin(BuildContext context) {
    _withContext(context).add(
      PagePushEvent(
        MaterialPage(
          child: const LoginPage(),
          key: UniqueKey(),
          name: LoginPagePath.info.location,
        ),
      ),
    );
  }

  static goToSignup(BuildContext context) {
    _withContext(context).add(
      PagePushEvent(
        MaterialPage(
            child: const SignupPage(),
            key: UniqueKey(),
            name: SignupPagePath.info.location),
      ),
    );
  }

  static goToOtp(BuildContext context) {
    _withContext(context).add(
      PagePushEvent(
        MaterialPage(
          child: const OtpPage(),
          key: UniqueKey(),
          name: OtpPagePath.info.location,
        ),
      ),
    );
  }

  static goToHome(BuildContext context) {
    _withContext(context).add(
      PagePushEvent(
        MaterialPage(
          child: const HomePage(),
          key: UniqueKey(),
          name: HomePagePath.info.location,
        ),
      ),
    );
  }

  static didPop(BuildContext context, Page page) {
    // TODO: check why this isn't being called whenever navigator pops page
    goBack(context);
    // _withContext(context).add(PagePopEvent(page));
  }

  static removeFirst(BuildContext context) {
    _withContext(context).add(FirstPagePopEvent());
  }

  static Future<void> setNewRoutePath(
      AppPath configuration, AppNavigatorBloc bloc) async {}
}
