import 'package:flutter/material.dart';
import 'package:flutter_resueable_components/Config/Colors/app_colors.dart';

class DynamicButtonWidget extends StatelessWidget {
  final double height;
  final VoidCallback? onPressed;
  final String text;
  const DynamicButtonWidget({
    super.key,
    this.height = 50.0,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
