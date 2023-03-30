import 'package:flutter/material.dart';
import 'package:login_demo/utils/routes/route_names.dart';
import 'package:login_demo/views/screens/login_screen.dart';
import 'package:login_demo/views/screens/profile_screen.dart';
import 'package:login_demo/views/screens/register_screen.dart';
import 'package:login_demo/views/screens/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.Login:
        return MaterialPageRoute(
            builder: (context) => LoginScreen(), settings: settings);

      case RouteNames.Register:
        return MaterialPageRoute(
            builder: (context) => RegisterScreen(), settings: settings);

      case RouteNames.Splash:
        return MaterialPageRoute(
            builder: (context) => SplashScreen(), settings: settings);

      case RouteNames.Profile:
        return MaterialPageRoute(
            builder: (context) => ProfileScreen(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No Route Found'),
                  ),
                ));
    }
  }
}
