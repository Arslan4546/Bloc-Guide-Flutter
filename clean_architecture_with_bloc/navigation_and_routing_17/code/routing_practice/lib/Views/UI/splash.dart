import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
