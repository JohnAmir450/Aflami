import 'package:aflami/core/thiming/colors.dart';
import 'package:flutter/material.dart';

Future<dynamic> customLoadingDialog(BuildContext context) {
    return showDialog(
            context: context,
            builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.mainPurple,
                  ),
                ));
  }