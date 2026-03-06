import 'package:equatable/equatable.dart';
import 'package:splash_screen_practice/Utils/Enums/api_enum.dart';

class LoginStates extends Equatable {
  final String email;
  final String password;
  final APIStatus apiStatus;
  final String errorMessage;
  const LoginStates({
    this.email = "",
    this.password = "",
    this.apiStatus = APIStatus.initial,
    this.errorMessage = "",
  });

  LoginStates copyWith({
    String? email,
    String? password,
    APIStatus? apiStatus,
    String? errorMessage,
  }) {
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
      apiStatus: apiStatus ?? this.apiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, apiStatus, errorMessage];
}
