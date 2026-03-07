import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class FlushBarHelper {
  static void flushBarError(String messge, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        message: messge,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        duration: Duration(seconds: 2),
        borderRadius: BorderRadius.circular(15),
        positionOffset: 20,
        backgroundColor: Colors.red,
        flushbarPosition: FlushbarPosition.TOP,

        icon: Icon(Icons.error, color: Colors.white, size: 28),
      )..show(context),
    );
  }

  static void flushBarSuccess(String messge, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        message: messge,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        duration: Duration(seconds: 2),
        borderRadius: BorderRadius.circular(15),
        positionOffset: 20,
        backgroundColor: Colors.green,
        flushbarPosition: FlushbarPosition.TOP,

        icon: Icon(Icons.error, color: Colors.white, size: 28),
      )..show(context),
    );
  }
}
