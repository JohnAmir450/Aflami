import 'package:flutter/material.dart';

class CustomAuthBackground extends StatelessWidget {
  final Widget child;
  const CustomAuthBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/auth_background.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: child);
  }
}