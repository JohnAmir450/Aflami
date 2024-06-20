import 'package:aflami/core/helpers/custom_snak_bar.dart';
import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/thiming/colors.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/features/register/logic/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          showSnackBar(context,
              text: 'Signed Up Successfully', color: Colors.green);
          context.pushReplacementNamed(Routes.homeScreen);
        }
        else if (state is RegisterPickedImageState) {
          showSnackBar(context,
              text: 'Photo Selected', color: ColorsManager.mainBlue);
        }
        else if(state is ChangePasswordVisibilityState){   }
        else if(state is RegisterCheckBoxFalseState){
          setupCheckedBoxErrorState(context,state.errorMessage);
        }
         else if (state is RegisterFailureState) {
          setupErrorState(context, state.errorMessage);
        }  else if (state is RegisterCheckBoxState) {
        } else {
          showDialog(
              context: context,
              builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainPurple,
                    ),
                  ));
        }
      },
      child: SizedBox(
        height: 50.h,
      ),
    );
  }

  void setupCheckedBoxErrorState(BuildContext context, String error) {
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
