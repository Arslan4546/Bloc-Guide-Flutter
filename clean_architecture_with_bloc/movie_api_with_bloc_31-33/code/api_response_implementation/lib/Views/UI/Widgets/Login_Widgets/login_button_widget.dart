import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_bloc.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_event.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_states.dart';
import 'package:splash_screen_practice/Configs/Routes/route_names.dart';
import 'package:splash_screen_practice/Repositories/Utils/Enums/enum.dart';
import 'package:splash_screen_practice/Repositories/Utils/Flush_Bar/flush_bar_helper.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
  const LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (previous, current) =>
          previous.apiStatus != current.apiStatus,
      listener: (context, state) {
        if (state.apiStatus == APIStatus.success) {
          FlushBarHelper.flushBarSuccess("Login Successful", context);
          Navigator.pushNamed(context, RouteNames.homeScreen);
        } else if (state.apiStatus == APIStatus.failed) {
          FlushBarHelper.flushBarSuccess("Login Failed", context);
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (previous, current) =>
            previous.apiStatus != current.apiStatus,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(SubmitButtonEvent());
              }
            },
            child: state.apiStatus == APIStatus.loading
                ? CircularProgressIndicator()
                : const Text('Login'),
          );
        },
      ),
    );
  }
}
