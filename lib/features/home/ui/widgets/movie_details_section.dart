import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/ui/widgets/trailer_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesDetailsSection extends StatelessWidget {
  const MoviesDetailsSection({
    super.key,
    required this.year,
    required this.moviesModel,
  });

  final int year;
  final MoviesModel moviesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                year.toString(),
                style: TextStyles.font14GreyRegular
                    .copyWith(color: Colors.white.withOpacity(0.75)),
              ),
              horizontalSpace(30.w),
              Text(
                moviesModel.adult == true ? '+18' : '+13',
                style: TextStyles.font14GreyRegular
                    .copyWith(color: Colors.white.withOpacity(0.75)),
              ),
              horizontalSpace(30.w),
              Text(
                moviesModel.voteAverage!.round().toString(),
                style: TextStyles.font14GreyRegular
                    .copyWith(color: Colors.white.withOpacity(0.75)),
              ),
              const Icon(
                Icons.star_rounded,
                size: 20,
                color: Colors.amber,
              ),
              horizontalSpace(5.w),
              Text('(${moviesModel.voteCount})',style: TextStyles.font14GreyRegular),
              horizontalSpace(25.w),
            ],
          ),
          verticalSpace(25.h),
          Text(
            'Overview',
            style: TextStyles.font26WhiteBold.copyWith(fontSize: 20),
          ),
          verticalSpace(15.h),
          Text(
            moviesModel.overview!,
            style: TextStyles.font16WhiteSemiBold,
            textAlign: TextAlign.start,
          ),
          verticalSpace(30.h),
          const TrailerSection(),
          verticalSpace(30.h),
          Text(
            'Similar Movies',
            style: TextStyles.font26WhiteBold.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}