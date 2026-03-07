import 'package:splash_screen_practice/Model/Movie_Model/movies_model.dart';

abstract class MovieRepo {
  Future<MoviesModel> movieAPI();
}
