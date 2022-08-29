import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victorbellofoundation/app_navigator/bloc/app_navigator_bloc.dart';
import 'package:victorbellofoundation/app_navigator/manager.dart';
import 'package:victorbellofoundation/app_navigator/path.dart' as path;

class AppRouter extends RouterDelegate<path.AppPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<path.AppPath> {
  final NavigatorManager navigatorManager = NavigatorManager();
  final bloc = AppNavigatorBloc();
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<AppNavigatorBloc, AppNavigatorState>(
        listener: (context, state) {
          notifyListeners();
        },
        builder: (context, state) {
          return Navigator(
            key: _navigatorKey,
            pages: List.of(state.pages),
            onPopPage: (Route<dynamic> route, dynamic result) {
              bool popped = route.didPop(result);
              if (!popped) {
                return false;
              }
              NavigatorManager.didPop(context, route.settings as Page);
              return false;
            },
          );
        },
      ),
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(path.AppPath configuration) async {
    return NavigatorManager.setNewRoutePath(configuration, bloc);
  }
}

class AppRouteParser extends RouteInformationParser<path.AppPath> {
  @override
  Future<path.AppPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    return _parseRouteInformation(routeInformation);
  }

  @override
  RouteInformation? restoreRouteInformation(path.AppPath configuration) {
    switch (configuration.runtimeType) {
      case path.SplashPagePath:
        return RouteInformation(location: path.SplashPagePath.info.location);
      case path.LoginPagePath:
        return RouteInformation(location: path.LoginPagePath.info.location);
      case path.SignupPagePath:
        return RouteInformation(location: path.SignupPagePath.info.location);
      default:
        return RouteInformation(location: path.UnknownPagePath.info.location);
    }
  }

  Future<path.AppPath> _parseRouteInformation(
      RouteInformation routeInformation) async {
    final pathSegments = Uri.parse(routeInformation.location!).pathSegments;

    return const path.UnknownPagePath();
  }
}
