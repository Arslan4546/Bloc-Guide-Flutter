import 'package:flutter/material.dart';
import 'package:splash_screen_practice/Views/UI/home.dart';
import 'package:splash_screen_practice/Views/UI/login.dart';
import 'package:splash_screen_practice/Views/UI/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'Home_Screen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case 'Login_Screen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'Splash_Screen':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
