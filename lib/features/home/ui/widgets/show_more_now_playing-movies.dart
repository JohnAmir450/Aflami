import 'package:aflami/core/helpers/custom_snak_bar.dart';
import 'package:aflami/core/thiming/colors.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/core/widgets/custom_arrow_back.dart';
import 'package:aflami/features/home/logic/now_playing_cubit/now_playing_cubit.dart';
import 'package:aflami/features/home/ui/widgets/movies_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowMoreNowPlayingMovies extends StatelessWidget {
  const ShowMoreNowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    int currentPage = 1;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 40.h, left: 15.w),
              child: const Row(
                children: [
                  CustomArrowBack(),
                  Text(
                    'Now Playing Movies',
                    style: TextStyles.font20WhiteSemiBold,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocConsumer<NowPlayingCubit, NowPlayingState>(
              listenWhen: (previous, current) =>
                  current is MoviesNowPlayingSuccessState ||
                  current is MoviesNowPlayingFailureState,
              listener: (context, state) {
                if (state is MoviesNowPlayingFailureState) {
                  showSnackBar(
                    color: Colors.red,
                    context,
                    text: ('Failed to load movies: ${state.errorMessage}'),
                  );
                }
              },
              builder: (context, state) {
                if (state is MoviesNowPlayingLoadingState) {
                  return SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: const Center(child: CircularProgressIndicator()));
                } else if (state is MoviesNowPlayingSuccessState) {
                  return GridView.builder(
                      itemCount: state.movies.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.8),
                      itemBuilder: (context, index) =>
                          CustomMovieItem(moviesModel: state.movies[index]));
                } else {
                  return const Center(child: Text('Unexpected state'));
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,
                  (index) => GestureDetector(
                        onTap: () {
                          currentPage = index + 1;
                          context
                              .read<NowPlayingCubit>()
                              .getNowPlaying(currentPage);
                        },
                        child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
                          builder: (context, state) {
                            return Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: currentPage == index + 1
                                      ? ColorsManager.mainPurple
                                      : Colors.white),
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
