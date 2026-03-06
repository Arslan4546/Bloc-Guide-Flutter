import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_bloc.dart';
import 'package:splash_screen_practice/Views/UI/Widgets/Login_Widgets/email_widget.dart';
import 'package:splash_screen_practice/Views/UI/Widgets/Login_Widgets/login_button_widget.dart';
import 'package:splash_screen_practice/Views/UI/Widgets/Login_Widgets/password_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  late LoginBloc _loginBloc;
  @override
  void initState() {
    _loginBloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailWidget(emailFocusNode: emailFocusNode),
                const SizedBox(height: 20),
                PasswordWidget(passwordFocusNode: passwordFocusNode),
                const SizedBox(height: 50),
                LoginButtonWidget(formKey: _formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
