import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_demo/connectivity/model/user.dart';
import 'package:login_demo/connectivity/session/user_session_manager.dart';
import 'package:login_demo/provider/user_auth_provider.dart';
import 'package:login_demo/res/utils.dart';
import 'package:login_demo/utils/routes/route_names.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var widthsize, heightsize;
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                : SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Container(
                        height: heightsize,
                        width: widthsize,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                RouteNames.Login);
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.pink,
                                        size: 30.0,
                                      ),
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
                                  'Register User',
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
                                  "Name",
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
                                    controller: nameController,
                                    cursorColor: Colors.black,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Name",
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
                                    cursorColor: Colors.black,
                                    inputFormatters: <TextInputFormatter>[
                                      LengthLimitingTextInputFormatter(8),
                                    ],
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
                                          r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                      if (nameController.text.isEmpty) {
                                        getFlushbar(
                                            'Please Enter Name', context);
                                      } else if (emailController.text.isEmpty) {
                                        getFlushbar(
                                            'Please Enter Email', context);
                                      } else if (!pattern
                                          .hasMatch(emailController.text)) {
                                        getFlushbar(
                                            'Please Enter Correct Email',
                                            context);
                                      } else if (passwordController
                                          .text.isEmpty) {
                                        getFlushbar(
                                            'Please Enter Password', context);
                                      } else if (passwordController
                                              .text.length <
                                          8) {
                                        getFlushbar(
                                            'Password length must be of 8 ',
                                            context);
                                      } else {
                                        authprovider.getRegisterUser(
                                            nameController.text.toString(),
                                            emailController.text.toString(),
                                            passwordController.text.toString(),
                                            handleResponse);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "Register",
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

  handleResponse(Map? data, String? message, bool? isError) async {
    if (data != null && !isError!) {
      User user = User.fromJson(data);

      UserSessionManager sessionManager = new UserSessionManager();
      bool isSetUser = await sessionManager.setUser(user);

      if (isSetUser) {
        await sessionManager.setLogin(true);
        Navigator.of(context).pushReplacementNamed(RouteNames.Profile,
            arguments: {'user': user});
        getFlushbar('$message', context);
      }
    } else {
      getFlushbar(message!, context);
    }
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
