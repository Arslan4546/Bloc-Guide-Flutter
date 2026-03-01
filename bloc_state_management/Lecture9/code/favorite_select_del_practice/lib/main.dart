import 'package:favorite_select_del_practice/Bloc/favorite_bloc/bloc/favorite_bloc.dart';
import 'package:favorite_select_del_practice/Repositories/favorite_repository.dart';
import 'package:favorite_select_del_practice/UI/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteBloc(FavoriteRepository()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(brightness: Brightness.dark),
        home: const FavoriteScreen(),
      ),
    );
  }
}
