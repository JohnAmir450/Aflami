import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/core/widgets/custom_arrow_back.dart';
import 'package:aflami/core/widgets/custom_auth_background.dart';
import 'package:aflami/features/register/ui/widgets/profile_Image_section.dart';
import 'package:aflami/features/register/ui/widgets/register_bloc_listener.dart';
import 'package:aflami/features/register/ui/widgets/register_text_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAuthBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 20.h),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomArrowBack(),
                  verticalSpace(18.h),
                  const Text(
                    'Create \nAccount',
                    style: TextStyles.font48WhiteMedium,
                  ),
                  const ProfileImageSection(),
                  const RegisterTextForms(),
                  const RegisterBlocListener()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

