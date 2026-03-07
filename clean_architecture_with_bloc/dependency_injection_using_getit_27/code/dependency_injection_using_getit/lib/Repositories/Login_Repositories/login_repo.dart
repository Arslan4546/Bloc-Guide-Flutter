import 'package:splash_screen_practice/Model/UserModel/user_model.dart';

abstract class LoginRepo {
  Future<UserModel> loginAPI(dynamic data);
}
