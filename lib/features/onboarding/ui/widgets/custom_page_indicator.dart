import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  final int imagesLength;
  const CustomPageIndicator({
    super.key,
    required this.pageController, required this.imagesLength,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(controller: pageController, count:imagesLength,effect: const ExpandingDotsEffect(
      activeDotColor: Color(0xff892AEC),
      dotColor: Colors.white,
      dotHeight: 10,dotWidth: 10
    ),);
  }
}
