import 'package:error_handler/presentation/home/view/home_view.dart';
import 'package:error_handler/presentation/splash/splash_view.dart';
import 'package:error_handler/presentation/util/resources/langauge_manager.dart';
import 'package:error_handler/presentation/util/resources/string_manager.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.strNoRouteFound.tr(context),
          ),
        ),
        body: Center(
          child: Text(
            AppStrings.strNoRouteFound.tr(context),
          ),
        ),
      ),
    );
  }
}
