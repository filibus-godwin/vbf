import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victorbellofoundation/app_navigator/bloc/app_navigator_bloc.dart';
import 'package:victorbellofoundation/app_navigator/path.dart';
import 'package:victorbellofoundation/login/view/view.dart';
import 'package:victorbellofoundation/signup/view/signup.dart';

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
          child: Container(),
          key: UniqueKey(),
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
        ),
      ),
    );
  }

  static didPop(BuildContext context, Page page) {
    _withContext(context).add(PagePopEvent(page));
  }

  static removeFirst(BuildContext context) {
    _withContext(context).add(FirstPagePopEvent());
  }

  static Future<void> setNewRoutePath(
      AppPath configuration, AppNavigatorBloc bloc) async {}
}
