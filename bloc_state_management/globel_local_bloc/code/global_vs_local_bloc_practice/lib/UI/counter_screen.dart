import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_vs_local_bloc_practice/Bloc/Counter_Bloc/bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Scaffold reBuilding");
    return BlocProvider(
      create: (context) => _counterBloc,

      child: Scaffold(
        appBar: AppBar(title: Text('Counter Screen')),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              print("Text Rebuilding");
              return Text(
                'Counter Value: ${state.counterValue}',
                style: TextStyle(fontSize: 24),
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (previous, current) => false,
              builder: (context, state) {
                print("Increment Rebuilding");
                return FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: Icon(Icons.add),
                );
              },
            ),
            BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (previous, current) => false,
              builder: (context, state) {
                print("Decrement Rebuilding");
                return FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: Icon(Icons.remove),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
