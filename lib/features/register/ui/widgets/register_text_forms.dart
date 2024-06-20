import 'package:aflami/core/helpers/app_regex.dart';
import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/core/widgets/custom_text_button.dart';
import 'package:aflami/core/widgets/custom_text_form_field.dart';
import 'package:aflami/features/register/logic/register_cubit/register_cubit.dart';
import 'package:aflami/features/register/ui/widgets/conditions_and_terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterTextForms extends StatelessWidget {
  const RegisterTextForms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        var cubit=context.read<RegisterCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name',
                style: TextStyles.font16WhiteSemiBold,
              ),
              verticalSpace(10.h),
               CustomTextFormField(
                 controller: cubit.nameController,
                hintText: 'e.g. John Amir',
                onChanged: (value){
                  cubit.nameController.text=value;
                },
                validator: (value){
                  if(value==null || value.isEmpty) return 'Name must be added';
                },
              ),
              verticalSpace(25.h),
              const Text(
                'Email',
                style: TextStyles.font16WhiteSemiBold,
              ),
              verticalSpace(10.h),
               CustomTextFormField(
                controller: cubit.emailController,
                hintText: 'e.g. example@mail.com',
                onChanged: (value){
                  cubit.emailController.text=value;
                },
                validator: (value){
                  if(value==null ||value.isEmpty||!AppRegex.isEmailValid(value)){
                    return 'Enter a valid email';
                  }
                },
              ),
              verticalSpace(25.h),
              const Text(
                'Password',
                style: TextStyles.font16WhiteSemiBold,
              ),
              verticalSpace(10.h),
               CustomTextFormField(
                controller: context.read<RegisterCubit>().passwordController,
                isObscureText: context.read<RegisterCubit>().isObscurePassword,
                suffixIcon: GestureDetector(onTap: (){
                  context.read<RegisterCubit>().changePasswordVisibility();
                },child: context.read<RegisterCubit>().suffix,),
                hintText: 'e.g. Examp!e2006',
                onChanged: (value){
                  context.read<RegisterCubit>().passwordController.text=value;
                },
                validator: (value){
                  if(value==null ||value.isEmpty||!AppRegex.isPasswordValid(value)){
                    return 'Enter a valid password';
                  }
                },
              ),
              verticalSpace(25.h),
              const Text(
                'Confirm Password',
                style: TextStyles.font16WhiteSemiBold,
              ),
              verticalSpace(10.h),
               CustomTextFormField(
                controller: cubit.passwordConfirmationController,
                isObscureText: cubit.isObscurePassword,
                suffixIcon: GestureDetector(
                  onTap: (){
                    cubit.changePasswordVisibility();
                  },
                  child: cubit.suffix),
                onChanged: (value){
                  cubit.passwordConfirmationController.text=value;
                },
                validator: (value){
                  if(value==null||value.isEmpty||value!=cubit.passwordController.text) return'Password doesn\'t confirm';
                },
              ),
              verticalSpace(15.h),
              const ConditionsAndTerms(),
              verticalSpace(15.h),
               CustomTextButton(
                onTap: (){
                  if(cubit.formKey.currentState!.validate()){
                    cubit.register();
                  }
                },
                text: 'Create account',
                style: TextStyles.font16WhiteSemiBold,
                gradient: const LinearGradient(
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
