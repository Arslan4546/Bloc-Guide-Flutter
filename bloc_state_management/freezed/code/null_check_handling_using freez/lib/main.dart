import 'package:flutter/material.dart';
import 'package:null_check_handling/Model/person_model.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PersonModel> person = [];

  @override
  void initState() {
    var data = [
      {'name': 'John', 'age': 30},
      {'name': 'Jane', 'age': 25},
      {'name': 'Doe', 'age': 40},
      {'name': 'John', 'age': 30},
      {'name': null, 'age': 25},
      {'name': null, 'age': 40},
      {'name': 'John', 'age': 30},
      {'name': 'Jane', 'age': 25},
      {'name': 'Doe', 'age': 40},
      {'name': 'Jane', 'age': 25},
    ];
    for (var item in data) {
      person.add(PersonModel.fromJson(item));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: person.length,
        itemBuilder: (context, index) {
          final personModel = person[index];
          return ListTile(
            title: Text(personModel.name.toString()),
            subtitle: Text('Age: ${personModel.age}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: null,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        child: const Icon(Icons.add),
      ),
    );
  }
}
