import 'package:flutter/material.dart';
import 'package:login_demo/connectivity/container/di_container.dart' as DI;
import 'package:login_demo/provider/UserAuthProvider.dart';
import 'package:login_demo/utils/routes/RouteNames.dart';
import 'package:login_demo/utils/routes/Routes.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await DI.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DI.getIt<UserAuthProvider>()),
    ],
    child: LoginApp(),
  ));
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo Rest Api',
      initialRoute: RouteNames.Login,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
