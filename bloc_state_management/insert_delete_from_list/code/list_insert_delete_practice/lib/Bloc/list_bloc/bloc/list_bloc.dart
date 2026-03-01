import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  List<String> items = [];
  ListBloc() : super(ListState()) {
    on<AddEvent>(_addFunction);

    on<DeleteEvent>(_deleteFunction);
  }

  void _addFunction(AddEvent event, Emitter<ListState> emit) {
    items.add(event.item);
    emit(state.copyWith(items: List.from(items)));
  }

  void _deleteFunction(DeleteEvent event, Emitter<ListState> emit) {
    items.remove(event.item);
    emit(state.copyWith(items: List.from(items)));
  }
}
