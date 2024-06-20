import 'package:aflami/core/helpers/errors_alret_dialog.dart';
import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/thiming/colors.dart';
import 'package:aflami/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          context.pushReplacementNamed(Routes.homeScreen);
        } else if (state is LoginChangePasswordVisibilityState) {
        } else if (state is LoginFailureState) {
          setupErrorState(context, state.errorMessage);
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
      child: const SizedBox.shrink(),
    );
  }
}
