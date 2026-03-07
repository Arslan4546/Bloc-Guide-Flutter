import 'package:splash_screen_practice/Model/Movie_Model/movies_model.dart';
import 'package:splash_screen_practice/Repositories/Movie_Repositories/movie_repository.dart';

class MovieMockRepo implements MovieRepo {
  @override
  Future<MoviesModel> movieAPI() async {
    await Future.delayed(Duration(seconds: 3));
    Map<String, dynamic> response = {"Token": "12345"};
    return MoviesModel.fromJson(response);
  }
}
