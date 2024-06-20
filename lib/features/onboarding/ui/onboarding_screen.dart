import 'package:aflami/features/onboarding/ui/widgets/onboarding_details_section.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
 late PageController pageController;
 @override
  void initState() {
    pageController=PageController();
    super.initState();
  }

final List<String>images=[
  'assets/images/onboarding_1.jpg',
  'assets/images/onboarding_2.jpg',
  'assets/images/onboarding_3.jpg',
  'assets/images/onboarding_4.jpg'
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: images.length,
            controller: pageController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index)=>
          Image.asset(
            images[index],
            fit: BoxFit.fill,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
          ),),
         
          OnboardingDetailsSection(pageController: pageController, images: images)
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}





