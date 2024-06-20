

import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMovieItem extends StatelessWidget {
  final double height;
    final double? width;
  const CustomMovieItem({
    super.key, required this.height,  this.width,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 9, vertical: 8),
      child: Column(
        children: [
          Image.asset(
            'assets/images/list_view_image.jpg',
            height:height,width: width,
            fit: BoxFit.fill,
          ),
          verticalSpace(5.h),
          Text(
            'Los miserables',
            style: TextStyles.font12GreyLight
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}