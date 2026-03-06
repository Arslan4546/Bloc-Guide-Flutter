import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splash_screen_practice/Config/Routes/route_names.dart';

class SplashScreenServices {
  void isLogin(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.loginScreen,
        (route) => false,
      ),
    );
  }
}
