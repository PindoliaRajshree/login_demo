import 'package:flutter/material.dart';
import 'package:login_demo/connectivity/model/user.dart';
import 'package:login_demo/connectivity/session/user_session_manager.dart';
import 'package:login_demo/provider/user_auth_provider.dart';
import 'package:login_demo/res/utils.dart';
import 'package:login_demo/utils/routes/route_names.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var widthsize, heightsize;
  User? user;

  @override
  Widget build(BuildContext context) {
    Map arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    user = arguments['user'];

    widthsize = MediaQuery.of(context).size.width;
    heightsize = MediaQuery.of(context).size.height;
    return Consumer<UserAuthProvider>(
      builder: (context, authprovider, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: authprovider.loader
                ? Center(
                    child: CircularProgressIndicator(color: Colors.pink),
                  )
                : Container(
                    width: widthsize,
                    height: heightsize,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    authprovider.UserLogout(
                                        user!.id, handleResponse);
                                  },
                                  child: Icon(
                                    Icons.logout_sharp,
                                    color: Colors.pink,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'User Profile',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                  fontSize: 26.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "Name",
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            user!.name.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            user!.email.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "User Type",
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            user!.userType.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  handleResponse(Map? data, String? message, bool? isError) async {
    if (data != null && !isError!) {
      User user = User.fromJson(data);
      print('${user.name}');

      UserSessionManager sessionManager = new UserSessionManager();
      bool isLogin = await sessionManager.getLogin();

      if (isLogin) {
        await sessionManager.logoutUser();
        Navigator.of(context).pushReplacementNamed(RouteNames.Login);
        getFlushbar('$message', context);
      }
    } else {
      getFlushbar(message!, context);
    }
  }
}
