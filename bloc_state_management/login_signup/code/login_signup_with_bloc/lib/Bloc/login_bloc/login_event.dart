part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmailChangedEvent extends LoginEvent {
  final String email;

  EmailChangedEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class PasswordChangedEvent extends LoginEvent {
  final String password;

  PasswordChangedEvent(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginAPIEvent extends LoginEvent {
  LoginAPIEvent();

  @override
  List<Object?> get props => [];
}
