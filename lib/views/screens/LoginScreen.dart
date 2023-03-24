import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_demo/connectivity/model/User.dart';
import 'package:login_demo/provider/UserAuthProvider.dart';
import 'package:login_demo/res/Utils.dart';
import 'package:login_demo/utils/routes/RouteNames.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var widthsize, heightsize;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    widthsize = MediaQuery.of(context).size.width;
    heightsize = MediaQuery.of(context).size.height;
    return Consumer<UserAuthProvider>(
      builder: (context, authProvider, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: authProvider.loader
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.pink,
                  ))
                : SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Container(
                        height: heightsize,
                        width: widthsize,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Login',
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
                              height: 50.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  "Email",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: emailController,
                                    cursorColor: Colors.black,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        color: Colors.black54,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black54,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: passwordController,
                                    inputFormatters: <TextInputFormatter>[
                                      LengthLimitingTextInputFormatter(8),
                                    ],
                                    cursorColor: Colors.black,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        color: Colors.black54,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black54,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      RegExp pattern = new RegExp(
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                      if (emailController.text.isEmpty) {
                                        getFlushbar(
                                            'Please Enter Email', context);
                                      } else if (!pattern
                                          .hasMatch(emailController.text)) {
                                        getFlushbar('Please Enter Correct Email',
                                            context);
                                      } else if (passwordController
                                          .text.isEmpty) {
                                        getFlushbar(
                                            'Please Enter Password', context);
                                      } else if (passwordController.text.length <
                                          8) {
                                        getFlushbar(
                                            'Password length must be of 8 ',
                                            context);
                                      } else {
                                        authProvider.UserLogin(
                                            emailController.text,
                                            passwordController.text,
                                            handleResponse);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.pink,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        RouteNames.Register);
                                  },
                                  child: Text(
                                    "Register User",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  handleResponse(Map? data, String? message) async {
    if (data != null) {
      User user = User.fromJson(data);
      Navigator.of(context).pushReplacementNamed(RouteNames.Profile,
          arguments: user);
      getFlushbar('${user.name} $message', context);
    } else {
      getFlushbar(message!, context);
    }
    emailController.clear();
    passwordController.clear();
  }
}
