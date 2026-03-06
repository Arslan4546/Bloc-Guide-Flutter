import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_bloc.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_event.dart';
import 'package:splash_screen_practice/Bloc/Login_bloc/login_states.dart';
import 'package:splash_screen_practice/Utils/Validations/validations.dart';

class EmailWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
  const EmailWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          decoration: const InputDecoration(
            hintText: 'email',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailEvent(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Email';
            }
            if (!Validations.emailValidation(value)) {
              return 'Invalid Email';
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
