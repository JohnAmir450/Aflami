import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/features/register/logic/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConditionsAndTerms extends StatefulWidget {

  const ConditionsAndTerms({
    super.key,
  });

  @override
  State<ConditionsAndTerms> createState() => _ConditionsAndTermsState();
}

class _ConditionsAndTermsState extends State<ConditionsAndTerms> {
   bool checkBoxValue=false;

  @override
  Widget build(BuildContext context) {
     
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final checkBoxValue = state is RegisterCheckBoxState ? state.isChecked : false;
        return Row(
          children: [
            Checkbox(value: checkBoxValue, onChanged: ( value) {
                  
                    if (value != null) {
                  context.read<RegisterCubit>().updateCheckBox(value);
                }
                 
            }),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: 'I agree to the ',
                  style: TextStyles.font15WhiteRegular),
              TextSpan(
                  text: 'terms',
                  style: TextStyles.font15WhiteRegular
                      .copyWith(decoration: TextDecoration.underline)),
              const TextSpan(
                  text: ' And ', style: TextStyles.font15WhiteRegular),
              TextSpan(
                  text: 'privacy \npolicy',
                  style: TextStyles.font15WhiteRegular
                      .copyWith(decoration: TextDecoration.underline))
            ]))
          ],
        );
      },
    );
  }
}
