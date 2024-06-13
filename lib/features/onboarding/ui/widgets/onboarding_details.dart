import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingDetails extends StatelessWidget {
  const OnboardingDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('We Have The Best Movies',
            textAlign: TextAlign.center,
            style: TextStyles.font32WhiteSemiBold),
        verticalSpace(50.h),
        const Text(
          'Lorem ipsum dolor sit amet, consectetur. But I want the advantage of this way of life. It is time to suspend the element of arrows in the valley of the disease. What a cartoon but to drink that recipe',
          style: TextStyles.font12GreyLight,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}