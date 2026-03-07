import 'package:flutter/material.dart';
import 'package:splash_screen_practice/Configs/Routes/route_names.dart';
import 'package:splash_screen_practice/Services/Storage/app_local_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              AppLocalStorage localStorage = AppLocalStorage();
              localStorage.deleteValue("token").then((value) {
                localStorage.deleteValue("isLogin").then((value) {
                  Navigator.pushNamed(context, RouteNames.loginScreen);
                });
              });
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text("This is Home Screen")),
    );
  }
}
