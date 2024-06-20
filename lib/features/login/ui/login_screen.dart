import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/core/widgets/custom_arrow_back.dart';
import 'package:aflami/core/widgets/custom_auth_background.dart';
import 'package:aflami/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:aflami/features/login/ui/widgets/login_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAuthBackground(
          child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomArrowBack(),
                verticalSpace(18.h),
                const Text(
                  'Welcome \nBack',
                  style: TextStyles.font48WhiteMedium,
                ),
                verticalSpace(60.h),
                const LoginForms(),
                const LoginBlocListener()
              ],
            ),
          ),
        ),
      )),
    );
  }
}

