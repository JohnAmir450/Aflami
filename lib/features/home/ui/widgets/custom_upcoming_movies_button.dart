import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/core/widgets/custom_text_button.dart';
import 'package:aflami/features/home/logic/upcoming_cubit/upcoming_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUpcomingMoviesButton extends StatelessWidget {
  const CustomUpcomingMoviesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Text(
            'Explore The Most Upcoming\n Movies ',
            textAlign: TextAlign.center,
            style: TextStyles.font20WhiteSemiBold,
          ),
          verticalSpace(20.h),
          CustomTextButton(
            text: 'Explore',
            style: TextStyles.font16WhiteSemiBold,
            onTap: () {
              
              context.pushNamed(Routes.upcomingMoviesScreen);
            },
            gradient: const LinearGradient(
              stops: [0, 100],
              colors: [Color(0xff892AEC), Color(0xff3635EC)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          )
        ],
      ),
    );
  }
}
