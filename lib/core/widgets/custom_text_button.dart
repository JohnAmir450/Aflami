import 'package:aflami/core/thiming/styles.dart';
import 'package:flutter/widgets.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Gradient? gradient;

  const CustomTextButton({
    super.key, required this.text, this.onTap, this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.sizeOf(context).width,
        decoration:  BoxDecoration(
          border: Border.all(color: const Color(0xff892AEC)),
            gradient: gradient),
        child:  Text(text,style: TextStyles.font18WhiteLight,textAlign: TextAlign.center,),
      ),
    );
  }
}