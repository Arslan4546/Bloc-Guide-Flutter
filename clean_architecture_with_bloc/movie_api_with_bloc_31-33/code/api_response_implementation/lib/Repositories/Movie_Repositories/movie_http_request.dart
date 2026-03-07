import 'package:splash_screen_practice/Configs/APP_Urls/app_urls.dart';
import 'package:splash_screen_practice/Data/Networks/APIs/network_api_services.dart';
import 'package:splash_screen_practice/Model/Movie_Model/movies_model.dart';
import 'package:splash_screen_practice/Repositories/Movie_Repositories/movie_repository.dart';

class MovieHttpRepo implements MovieRepo {
  final _api = MovieAPIServices();
  @override
  Future<MoviesModel> movieAPI() async {
    final response = await _api.getAPI(AppUrls.movieApiUrl);
    return MoviesModel.fromJson(response);
  }
}
