import 'package:aflami/core/helpers/errors_alret_dialog.dart';
import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/features/home/logic/top_rated_cubit/top_rated_cubit.dart';
import 'package:aflami/features/home/ui/widgets/movies_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRatedListView extends StatelessWidget {
  final String title;

  const TopRatedListView({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedCubit, TopRatedState>(
      builder: (context, state) {
        if (state is MoviesTopRatedSuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyles.font20WhiteSemiBold,
                    ),
                    GestureDetector(
                      onTap: (){context.pushNamed(Routes.showMoreTopRatedMovies ,arguments:state.movies );},
                      child: Text('Show More',style: TextStyles.font13GreyRegular.copyWith(decoration: TextDecoration.underline),))
                  ],
                ),
                SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        CustomMovieItem(moviesModel: state.movies[index]),
                  ),
                ),
              ],
            ),
          );
        } else if (state is MoviesTopRatedFailureState) {
          return CustomAlertDialog(error: 'state.errorMessage',onPressed: () {
               context.pushReplacementNamed(Routes.homeScreen);
             },);
        } else {
          return const SizedBox.shrink();    
        }
      },
    );
  }
}
