import 'package:flutter/material.dart';
import 'package:flutter_resueable_components/Config/Components/dynamic_button.dart';
import 'package:flutter_resueable_components/Config/Components/text_form_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          children: [
            DynamicButtonWidget(onPressed: () {}, text: 'Click Me'),
            const SizedBox(height: 20),
            DynamicButtonWidget(
              onPressed: () {},
              text: 'Another Button',
              height: 60,
            ),
            const SizedBox(height: 20),

            CustomTextFormField(
              hintText: 'Enter your name',
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
