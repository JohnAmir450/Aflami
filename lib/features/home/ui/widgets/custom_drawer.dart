import 'dart:io';

import 'package:aflami/core/helpers/cache_helper.dart';
import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/thiming/colors.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/features/home/logic/home_cubit/home_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeCubitSuccessState) {
              return Column(
                children: [
                  verticalSpace(100.h),
                  CircleAvatar(
                    backgroundColor: ColorsManager.mainPurple,
                    radius: 90.r,
                    child: state.userModel.profileImage ==
                            'assets/images/profile 7.png'
                        ? CircleAvatar(
                            radius: 85.r,
                            backgroundImage:
                                const AssetImage('assets/images/profile 7.png'))
                        : CircleAvatar(
                            radius: 85.r,
                            backgroundImage:
                                FileImage(File(state.userModel.profileImage!)),
                          ),
                  ),
                  verticalSpace(30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Hi, ',
                        style: TextStyles.font24BlackBold,
                      ),
                      Text(
                        state.userModel.name!,
                        style: TextStyles.font26WhiteBold
                            .copyWith(color: ColorsManager.mainPurple),
                      )
                    ],
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {
                      CacheHelper.clearAllData();
                      context.pushNamed(Routes.onboardingScreen);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Log Out',
                          style: TextStyles.font14GreyRegular
                              .copyWith(color: Colors.red, fontSize: 18),
                        ),
                        horizontalSpace(8.w),
                        const Icon(
                          Icons.logout_outlined,
                          color: Colors.red,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                  verticalSpace(100.h),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
