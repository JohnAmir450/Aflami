  import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:flutter/material.dart';

  
  void setupCheckedBoxErrorState(BuildContext context, String error) {
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
            onPressed: () {
              context.pop();
            },
            child: const Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(error: error,onPressed: (){context.pop();},),
    );
  }

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