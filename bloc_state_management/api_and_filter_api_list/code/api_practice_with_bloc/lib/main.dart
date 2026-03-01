import 'package:api_practice_with_bloc/Bloc/API_Bloc/bloc/api_bloc.dart';
import 'package:api_practice_with_bloc/Repositories/api_repository.dart';
import 'package:api_practice_with_bloc/UI/api_screen.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => ApiBloc(ApiRepository()),
        child: const APIPage(),
      ),
    );
  }
}
