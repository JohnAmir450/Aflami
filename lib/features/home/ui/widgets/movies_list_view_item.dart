import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/networking/constants.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/thiming/colors.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMovieItem extends StatelessWidget {
  final MoviesModel moviesModel;
  final double? height;
  final double? width;
  
  const CustomMovieItem({
    super.key,
    required this.moviesModel, this.height, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         context.pushNamed(Routes.movieDetails,arguments:  moviesModel);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
        decoration: BoxDecoration(
          
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl:
                    '${Constants.imageUrl}${moviesModel.backdropPath}',fit: BoxFit.cover,height:height?? 150.h,width: width ,
                placeholder: (context, url) => const Center(child:  CircularProgressIndicator(color: ColorsManager.mainPurple,)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            verticalSpace(5.h),
            Text(
              moviesModel.originalTitle.toString(),textAlign: TextAlign.center,
              style: TextStyles.font15WhiteRegular,
            )
          ],
        ),
      ),
    );
  }
}
