import 'package:aflami/core/widgets/custom_arrow_back.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CustomArrowBack()),
    );
  }
}