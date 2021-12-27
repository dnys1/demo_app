import 'package:demo/ui/screen/home/home_screen.dart';
import 'package:demo/ui/screen/loading/loading_screen.dart';
import 'package:demo/ui/screen/login/login_screen.dart';
import 'package:flutter/material.dart';

/// Key used to access the navigator from outside the widget tree.
final navigatorKey = GlobalKey<NavigatorState>();

final routes = <String, WidgetBuilder>{
  Routes.loading.name: (context) => const LoadingScreen(),
  Routes.home.name: (context) => const HomeScreen(),
  Routes.login.name: (context) => const LoginScreen(),
};

/// Navigates using [fn].
///
/// Schedules the navigation for the next frame to prevent conflicts with
/// ongoing rebuilds.
void navigate(void Function(NavigatorState) fn) {
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    fn(navigatorKey.currentState!);
  });
}

enum Routes {
  loading,
  login,
  home,
}

extension RouteNames on Routes {
  String get name {
    switch (this) {
      case Routes.loading:
        return '/';
      case Routes.login:
        return '/login';
      case Routes.home:
        return '/home';
    }
  }
}
