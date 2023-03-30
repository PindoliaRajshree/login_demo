import 'package:flutter/material.dart';
import 'package:login_demo/connectivity/model/user.dart';
import 'package:login_demo/connectivity/session/user_session_manager.dart';
import 'package:login_demo/utils/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateTo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontSize: 28.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
            color: Colors.pink,
          ),
        ],
      ),
    );
  }

  void navigateTo() async {
    UserSessionManager userSessionManager = new UserSessionManager();
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    print(await userSessionManager.getLogin());
    if (await userSessionManager.getLogin()) {
      User user = await userSessionManager.getUser();
      Navigator.of(context)
          .pushReplacementNamed(RouteNames.Profile, arguments: {'user': user});
    } else {
      userSessionManager.setLogin(false);
      Navigator.of(context).pushReplacementNamed(RouteNames.Login);
    }
  }
}
