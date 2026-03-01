import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

      ]
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Person person1 = Person(age: 23, name: "Arslan");
          Person person2 = Person(age: 23, name: "Mannan");
          print(person1 == person2);
          // now this print true
          // Person person1 = Person(age: 23, name: "Arslan");
          // Person person2 = Person(age: 23, name: "Arslan");
          // print(person1 == person2);
          // this will print the flase becasue it is comparing the memory location of the objects
        },
      ),
    );
  }
}

class Person extends Equatable {
  String name;
  int age;
  Person({required this.age, required this.name});

  @override
  List<Object?> get props => [name, age];
}

// this is the code before the equatable package
// class Person {
//   String name;
//   int age;
//   Person({required this.age, required this.name});

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         other is Person &&
//             runtimeType == other.runtimeType &&
//             name == other.name &&
//             age == other.age;
//   }

//   @override
//   int get hashCode => name.hashCode ^ age.hashCode;
// }
