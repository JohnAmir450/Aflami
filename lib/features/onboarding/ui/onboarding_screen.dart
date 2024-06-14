import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/widgets/custom_text_button.dart';
import 'package:aflami/features/onboarding/ui/widgets/custom_page_indicator.dart';
import 'package:aflami/features/onboarding/ui/widgets/onboarding_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
final PageController pageController=PageController();
final List<String>images=[
  'assets/images/after.jpg',
  'assets/images/after (1).jpg',
  'assets/images/after (2).jpg',
  'assets/images/after (3).jpg'
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
         
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 3,),
                const OnboardingDetails(),
                 verticalSpace(20.h),
                CustomPageIndicator(pageController: pageController,imagesLength: images.length,),
                verticalSpace(30.h),
                 CustomTextButton(
                  text: 'Register now in Aflami',
                  gradient: const LinearGradient(
                    stops: [0, 100],
                    colors: [Color(0xff892AEC), Color(0xff3635EC)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  onTap: (){
                    context.pushNamed(Routes.registerScreen);
                  },
                ),
                verticalSpace(31.h),
                CustomTextButton(
                  text: 'Already have an account ?',
                  onTap: (){
                    context.pushNamed(Routes.loginScreen);
                  },
                ),
                const Spacer(flex: 1,),
              ],
            ),
          )
        ],
      ),
    );
  }
}



