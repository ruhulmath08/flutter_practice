import 'package:flutter/material.dart';
import 'package:flutter_practice/src/core/themes/styles/app_colors.dart';

class IncrementDecrementButton extends StatelessWidget {
  const IncrementDecrementButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isDisableButton = false,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final bool isDisableButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: isDisableButton ? null : onPressed,
        child: Icon(
          icon,
          size: 33,
          color: isDisableButton ? Colors.grey : AppColors.deepPurple,
        ),
      ),
    );
  }
}