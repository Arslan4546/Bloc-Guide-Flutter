import 'package:splash_screen_practice/Configs/APP_Urls/app_urls.dart';
import 'package:splash_screen_practice/Data/Networks/APIs/network_api_services.dart';
import 'package:splash_screen_practice/Model/UserModel/user_model.dart';
import 'package:splash_screen_practice/Repositories/Login_Repositories/login_repo.dart';

class LoginRepoHttp implements LoginRepo {
  final _api = LoginAPIServices();
  @override
  Future<UserModel> loginAPI(dynamic data) async {
    final response = await _api.postAPI(AppUrls.apiUrl, data);
    return UserModel.fromJson(response);
  }
}
