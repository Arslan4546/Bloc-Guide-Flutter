import 'package:equatable/equatable.dart';

sealed class MovieEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MoviesFetchEvent extends MovieEvents {}
