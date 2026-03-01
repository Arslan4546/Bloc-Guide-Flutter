part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({required this.counter});

  @override
  List<Object> get props => [counter];

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }
}
