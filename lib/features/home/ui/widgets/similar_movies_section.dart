import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/widgets/custom_alret_dialog.dart';
import 'package:aflami/features/home/logic/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:aflami/features/home/ui/widgets/movies_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarMoviesSection extends StatelessWidget {
  const SimilarMoviesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
      builder: (context, state) {
        if (state is SimilarMoviesSuccessState) {
          return SizedBox(
            height: 250.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.movies.length,
              itemBuilder: (context, index) =>
                  CustomMovieItem(moviesModel: state.movies[index]),
            ),
          );
        } else if (state is SimilarMoviesFailureState) {
          return CustomAlertDialog(
            error: state.errorMessage,
            onPressed: () {
              context.pushReplacementNamed(Routes.homeScreen);
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
