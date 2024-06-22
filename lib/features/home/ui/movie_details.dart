import 'package:aflami/core/helpers/errors_alret_dialog.dart';
import 'package:aflami/core/helpers/extentions.dart';
import 'package:aflami/core/helpers/spacing.dart';
import 'package:aflami/core/networking/constants.dart';
import 'package:aflami/core/routing/routes.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/core/widgets/custom_arrow_back.dart';
import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/logic/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:aflami/features/home/logic/trailer_cubit/trailer_cubit.dart';
import 'package:aflami/features/home/ui/widgets/movies_list_view_item.dart';
import 'package:aflami/features/home/ui/widgets/trailer_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetails extends StatelessWidget {
  final MoviesModel moviesModel;
  const MovieDetails({super.key, required this.moviesModel});

  @override
  Widget build(BuildContext context) {
    String releaseDate = moviesModel.releaseDate ?? '';
    DateTime dateTime = DateTime.parse(releaseDate);
    int year = dateTime.year;

    // Fetch trailers when the screen is loaded
    context.read<TrailerCubit>().getMovieTrailers(moviesModel.id!);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xff0A071E),
            leading: const CustomArrowBack(),
            expandedHeight: MediaQuery.sizeOf(context).height / 1.5,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: '${Constants.imageUrl}${moviesModel.posterPath}',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
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
                      horizontalSpace(30.w),
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
                  Text(
                    'Trailers',
                    style: TextStyles.font26WhiteBold.copyWith(fontSize: 20),
                  ),
                  BlocBuilder<TrailerCubit, TrailerState>(
                    builder: (context, state) {
                      if (state is TrailerLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is TrailerFailureState) {
                        return CustomAlertDialog(
                          error: 'state.errorMessage',
                          onPressed: () {
                            context.pushReplacementNamed(Routes.homeScreen);
                          },
                        );
                      } else if (state is TrailerSuccessState) {
                        return TrailerItem(
                          trailer: state.trailerModel.results![0],
                        );
                      }
                      return Container();
                    },
                  ),
                  verticalSpace(30.h),
                  Text(
                    'Similar Movies',
                    style: TextStyles.font26WhiteBold.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
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
                    error: 'state.errorMessage',
                    onPressed: () {
                      context.pushReplacementNamed(Routes.homeScreen);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
