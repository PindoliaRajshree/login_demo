import 'package:flutter/material.dart';
import 'package:login_demo/connectivity/model/User.dart';
import 'package:login_demo/utils/routes/RouteNames.dart';
import 'package:login_demo/views/screens/LoginScreen.dart';
import 'package:login_demo/views/screens/ProfileScreen.dart';
import 'package:login_demo/views/screens/RegisterScreen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.Login:
        return MaterialPageRoute(
            builder: (context) => LoginScreen(), settings: settings);

      case RouteNames.Register:
        return MaterialPageRoute(
            builder: (context) => RegisterScreen(), settings: settings);

      case RouteNames.Profile:
        final args = settings.arguments as User;
        return MaterialPageRoute(
            builder: (context) => ProfileScreen(
                  user: args,
                ),
            settings: settings);

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
