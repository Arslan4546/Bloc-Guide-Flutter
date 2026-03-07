import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splash_screen_practice/Configs/Routes/route_names.dart';
import 'package:splash_screen_practice/Services/Session_Manager/session_controller.dart';

class SplashService {
  static void isLogin(BuildContext context) {
    SessionController()
        .getUserFromPreference()
        .then((value) {
          if (SessionController.isLogin!) {
            Timer(
              Duration(seconds: 3),
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.homeScreen,
                (route) => false,
              ),
            );
          } else {
            Timer(
              Duration(seconds: 3),
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.loginScreen,
                (route) => false,
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          Timer(
            Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.loginScreen,
              (route) => false,
            ),
          );
        });
  }
}
