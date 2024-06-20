import 'package:aflami/core/thiming/colors.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
       this.hintText,
      this.isObscureText = false,
      this.suffixIcon,
      this.onChanged,
      this.focusedBorder,
      this.enabledBorder,
      this.hintStyle,
      this.inputTextStyle,
      this.controller,
       this.validator,
      this.keyboardType});
  final String? hintText;
  final bool isObscureText;
  final Widget? suffixIcon;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      cursorColor: ColorsManager.mainBlue,
      obscureText: isObscureText,
      keyboardType: keyboardType,
      style: inputTextStyle ?? TextStyles.font15WhiteRegular,
      decoration: InputDecoration(
          fillColor: const Color(0xff3F1E88),
          filled: true,
          hintStyle: hintStyle ??
              TextStyles.font14GreyRegular
                  .copyWith(color: ColorsManager.lightGrey),
          hintText: hintText,
          suffixIcon: suffixIcon,
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          enabledBorder: enabledBorder ??
              customOutlineInputBorder(color: ColorsManager.mainPurple),
          focusedBorder: focusedBorder ??
              customOutlineInputBorder(color: ColorsManager.mainPurple),
          errorBorder: customOutlineInputBorder(color: Colors.red),
          focusedErrorBorder: customOutlineInputBorder(color: Colors.red)),
    );
  }

  OutlineInputBorder customOutlineInputBorder({ Color color =const Color(0xff3F1E88)}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.3),
     
    );
  }
}