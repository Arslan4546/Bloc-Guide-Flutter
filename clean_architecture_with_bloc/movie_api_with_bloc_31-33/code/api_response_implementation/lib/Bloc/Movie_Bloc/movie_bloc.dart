import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_practice/Bloc/Movie_Bloc/movie_events.dart';
import 'package:splash_screen_practice/Bloc/Movie_Bloc/movie_states.dart';
import 'package:splash_screen_practice/Data/Response/api_response.dart';
import 'package:splash_screen_practice/Repositories/Movie_Repositories/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvents, MovieStates> {
  final MovieRepo movieRepo;
  MovieBloc({required this.movieRepo})
    : super(MovieStates(moviesList: ApiResponse.loading())) {
    on<MoviesFetchEvent>(_fetchMovieFun);
  }

  void _fetchMovieFun(MoviesFetchEvent event, Emitter<MovieStates> emit) async {
    await movieRepo
        .movieAPI()
        .then((value) {
          emit(state.copyWith(moviesList: ApiResponse.completed(value)));
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(moviesList: ApiResponse.failed(error.toString())),
          );
        });
  }
}
