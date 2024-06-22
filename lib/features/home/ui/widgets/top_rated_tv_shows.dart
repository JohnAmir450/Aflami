import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/core/widgets/custom_alret_dialog.dart';
import 'package:aflami/features/home/logic/top_rated_tv_shows/top_rated_tv_shows_cubit.dart';
import 'package:aflami/features/home/ui/widgets/movies_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRateTVShows extends StatelessWidget {
  final String title;
  const TopRateTVShows({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(50.h),
          Text(
            title,
            style: TextStyles.font20WhiteSemiBold,
          ),
          verticalSpace(15.h),
          BlocBuilder<TopRatedTvShowsCubit, TopRatedTvShowsState>(
            builder: (context, state) {
              if (state is TopRatedTvShowsSuccessState) {
                return SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movies.length,
                      itemBuilder: (context, index) =>
                          CustomMovieItem(moviesModel: state.movies[index],)),
                          
                );
              }else if (state is TopRatedTvShowsFailureState){
                return CustomAlertDialog(error:state.errorMessage,onPressed: () {
               context.pushReplacementNamed(Routes.homeScreen);
             },);
              }else{
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }
}
