import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:splash_screen_practice/Configs/Routes/route_names.dart';
import 'package:splash_screen_practice/Configs/Routes/routes.dart';

import 'package:splash_screen_practice/Repositories/Login_Repositories/login_repo.dart';
import 'package:splash_screen_practice/Repositories/Login_Repositories/mock_request.dart';
import 'package:splash_screen_practice/Repositories/Movie_Repositories/movie_http_request.dart';
import 'package:splash_screen_practice/Repositories/Movie_Repositories/movie_repository.dart';

GetIt getIt = GetIt.instance;
void main() {
  runApp(const MyApp());
  serviceLocator();
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
      initialRoute: RouteNames.homeScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

// phly base class do and then phir jo required hai mock ya http wali then wo do
void serviceLocator() {
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepoMock());
  getIt.registerLazySingleton<MovieRepo>(() => MovieHttpRepo());
}
