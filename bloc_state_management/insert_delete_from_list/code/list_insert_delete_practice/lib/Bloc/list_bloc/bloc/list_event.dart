part of 'list_bloc.dart';

@immutable
sealed class ListEvent {
  const ListEvent();
}

class AddEvent extends ListEvent {
  final String item;
  const AddEvent(this.item);
  List<Object?> get props => [item];
}

class DeleteEvent extends ListEvent {
  final Object item;
  const DeleteEvent(this.item);
  List<Object?> get props => [item];
}
