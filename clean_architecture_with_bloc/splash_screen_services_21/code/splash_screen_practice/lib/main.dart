import 'package:flutter/material.dart';
import 'package:splash_screen_practice/Config/Routes/route_names.dart';
import 'package:splash_screen_practice/Config/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RouteNames.splashScreen,
    );
  }
}
