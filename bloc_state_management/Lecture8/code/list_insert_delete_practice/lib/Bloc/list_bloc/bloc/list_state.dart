part of 'list_bloc.dart';

@immutable
class ListState extends Equatable {
  final List<String> items;

  const ListState({this.items = const []});

  ListState copyWith({List<String>? items}) {
    return ListState(items: items ?? this.items);
  }

  @override
  List<Object?> get props => [items];
}
