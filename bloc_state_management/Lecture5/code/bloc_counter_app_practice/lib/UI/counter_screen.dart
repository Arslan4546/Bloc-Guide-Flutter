import 'package:bloc_counter_app_practice/Bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Screen')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: OverflowBar(
        alignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounter());
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              // Decrement logic
              context.read<CounterBloc>().add(DecrementCounter());
            },
            child: Icon(Icons.remove),
          ),
        ],
        // this is the counter screen that i created using flutter_bloc package
      ),
    );
  }
}
