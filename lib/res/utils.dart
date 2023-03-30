import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Flushbar getFlushbar(String message,BuildContext context) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: Colors.pink,
    message: message,
    messageSize: 16.0,
    messageColor: Colors.white,
    duration: Duration(seconds: 5),
    flushbarStyle: FlushbarStyle.FLOATING,
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    borderRadius: BorderRadius.circular(10),
  )..show(context);
}
