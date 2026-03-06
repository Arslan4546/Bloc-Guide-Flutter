import 'package:splash_screen_practice/Configs/APP_Urls/app_urls.dart';
import 'package:splash_screen_practice/Data/Networks/APIs/network_api_services.dart';
import 'package:splash_screen_practice/Model/UserModel/user_model.dart';

class LoginRepo {
  final _api = LoginAPIServices();

  Future<UserModel> loginAPI(dynamic data) async {
    final response = await _api.postAPI(AppUrls.apiUrl, data);
    return UserModel.fromJson(response);
  }
}
