import 'package:equatable/equatable.dart';
import 'package:splash_screen_practice/Data/Response/api_response.dart';
import 'package:splash_screen_practice/Model/Movie_Model/movies_model.dart';

class MovieStates extends Equatable {
  final ApiResponse<MoviesModel> moviesList;
  const MovieStates({required this.moviesList});

  MovieStates copyWith({ApiResponse<MoviesModel>? moviesList}) {
    return MovieStates(moviesList: moviesList ?? this.moviesList);
  }

  @override
  List<Object?> get props => [moviesList];
}
