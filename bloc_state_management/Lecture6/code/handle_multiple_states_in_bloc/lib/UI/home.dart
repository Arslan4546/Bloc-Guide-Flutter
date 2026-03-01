import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handle_multiple_states_in_bloc/Bloc/switch_bloc/bloc/switch_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.isSwitch != current.isSwitch,
              builder: (context, state) {
                print("Switch Building");
                return Switch(
                  value: state.isSwitch,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(
                      EnableOrDisableNotificationEvent(),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.isSlider != current.isSlider,
              builder: (context, state) {
                print("Container Building");
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    height: 200,
                    // ignore: deprecated_member_use
                    color: Colors.red.withOpacity(state.isSlider),
                  ),
                );
              },
            ),

            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.isSlider != current.isSlider,
              builder: (context, state) {
                print("Slider Building");
                return Slider(
                  value: state.isSlider,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
