import 'package:splash_screen_practice/Model/UserModel/user_model.dart';
import 'package:splash_screen_practice/Repositories/Login_Repositories/login_repo.dart';

class LoginRepoMock implements LoginRepo {
  @override
  Future<UserModel> loginAPI(dynamic data) async {
    await Future.delayed(Duration(seconds: 3));
    Map<String, dynamic> response = {"Token": "12345"};
    return UserModel.fromJson(response);
  }
}
