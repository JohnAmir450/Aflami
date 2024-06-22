import 'package:aflami/core/thiming/styles.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String error;
  final void Function()? onPressed;
  const CustomAlertDialog({
    super.key, required this.error, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: TextStyles.font15DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Got it',
            style: TextStyles.font14BlueSemiBold,
          ),
        ),
      ],
    );
  }
}