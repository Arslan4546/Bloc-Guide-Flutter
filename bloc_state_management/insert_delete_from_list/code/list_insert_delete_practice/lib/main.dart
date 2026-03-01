import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_insert_delete_practice/Bloc/list_bloc/bloc/list_bloc.dart';
import 'package:list_insert_delete_practice/UI/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ListScreen(),
      ),
    );
  }
}
