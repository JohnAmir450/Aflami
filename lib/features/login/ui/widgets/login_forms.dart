import 'package:aflami/core/helpers/app_regex.dart';
import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/core/widgets/custom_text_button.dart';
import 'package:aflami/core/widgets/custom_text_form_field.dart';
import 'package:aflami/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForms extends StatelessWidget {
  const LoginForms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Email',
                style: TextStyles.font16WhiteSemiBold,
              ),
              verticalSpace(10.h),
              CustomTextFormField(
                hintText: 'Enter your email',
                onChanged: (value) {
                  cubit.emailController.text = value;
                },
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return 'Enter a valid email';
                  }
                },
              ),
              verticalSpace(40.h),
              const Text(
                'Password',
                style: TextStyles.font16WhiteSemiBold,
              ),
              verticalSpace(10.h),
              CustomTextFormField(
                isObscureText: cubit.isObscurePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    cubit.changePasswordVisibility();
                  },
                  child: cubit.suffix,
                ),
                hintText: 'Enter your Password',
                onChanged: (value) {
                  cubit.passwordController.text = value;
                },
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isPasswordValid(value)) {
                    return 'Enter a valid password';
                  }
                },
              ),
              verticalSpace(80.h),
              CustomTextButton(
                text: 'Login',
                onTap: () {
                  if(cubit.formKey.currentState!.validate()){
                    cubit.login();
                  }
                },
                style: TextStyles.font16WhiteSemiBold,
                gradient:const  LinearGradient(
                  stops: [0, 100],
                  colors: [Color(0xff892AEC), Color(0xff3635EC)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              
            ],
          ),
        );
      },
    );
  }
}
