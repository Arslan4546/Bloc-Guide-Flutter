import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_bloc.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_event.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_states.dart';

class PasswordWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.text,
          focusNode: passwordFocusNode,
          decoration: const InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordEvent(password: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter password';
            }
            if (value.length < 6) {
              return "password is too short";
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
