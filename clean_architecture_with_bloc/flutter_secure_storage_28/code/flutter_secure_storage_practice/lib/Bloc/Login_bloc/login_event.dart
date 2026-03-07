import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmailEvent extends LoginEvent {
  final String email;
  EmailEvent({required this.email});
  @override
  List<Object?> get props => [email];
}

class PasswordEvent extends LoginEvent {
  final String password;
  PasswordEvent({required this.password});
  @override
  List<Object?> get props => [password];
}

class EmailUnFocusEvent extends LoginEvent {}

class PasswordUnFocusEvent extends LoginEvent {}

class SubmitButtonEvent extends LoginEvent {}
