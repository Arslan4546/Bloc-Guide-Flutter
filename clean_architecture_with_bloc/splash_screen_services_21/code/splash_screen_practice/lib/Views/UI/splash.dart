import 'package:flutter/material.dart';
import 'package:splash_screen_practice/Services/Splash/splash_screen_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenServices _splashScreenServices = SplashScreenServices();

  @override
  void initState() {
    _splashScreenServices.isLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome to the Splash Screen!'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'Login_Screen');
              },
              child: Text('Go to Login Screen'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'Home_Screen');
              },
              child: Text('Go to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
