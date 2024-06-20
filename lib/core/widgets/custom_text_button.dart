import 'package:aflami/core/thiming/colors.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:flutter/widgets.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final void Function()? onTap;
  final Gradient? gradient;

  const CustomTextButton({
    super.key, required this.text, this.onTap, this.gradient, this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: MediaQuery.sizeOf(context).width,
        decoration:  BoxDecoration(
          border: Border.all(color: ColorsManager.mainPurple),
            gradient: gradient),
        child:  Text(text,style: style ?? TextStyles.font18WhiteLight,textAlign: TextAlign.center,),
      ),
    );
  }
}