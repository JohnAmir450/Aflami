import 'package:aflami/core/thiming/colors.dart';
import 'package:flutter/material.dart';

class CustomPagesNumber extends StatelessWidget {
  final int index;
  const CustomPagesNumber({
    super.key,
    required this.currentPage, required this.index,
  });

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: currentPage == index + 1
              ? ColorsManager.mainPurple
              : Colors.white),
      child: Text(
        (index + 1).toString(),
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
