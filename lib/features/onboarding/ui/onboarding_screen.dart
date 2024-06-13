import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/widgets/custom_text_button.dart';
import 'package:aflami/features/onboarding/ui/widgets/onboarding_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/onboarding_background.png',
            fit: BoxFit.fill,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
          ),
          Image.asset(
            'assets/images/Rectangle 185.png',
            fit: BoxFit.fill,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 3,),
                const OnboardingDetails(),
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


