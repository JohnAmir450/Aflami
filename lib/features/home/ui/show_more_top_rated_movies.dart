import 'package:aflami/core/helpers/errors_alret_dialog.dart';
import 'package:aflami/core/widgets/custom_arrow_back.dart';
import 'package:aflami/core/widgets/custom_pages_numbers.dart';
import 'package:aflami/features/home/logic/top_rated_cubit/top_rated_cubit.dart';
import 'package:aflami/features/home/ui/widgets/movies_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowMoreTopRatedMoviesMovies extends StatelessWidget {
  const ShowMoreTopRatedMoviesMovies({super.key});

  @override
  Widget build(BuildContext context) {
    int currentPage = 1;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, left: 15.w),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomArrowBack(),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocConsumer<TopRatedCubit, TopRatedState>(
            listenWhen: (previous, current) =>
                current is MoviesTopRatedSuccessState ||
                current is MoviesTopRatedFailureState,
            listener: (context, state) {
              if (state is MoviesTopRatedFailureState) {
                setupErrorState(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is MoviesTopRatedLoadingState) {
                return SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: const Center(child: CircularProgressIndicator()));
              } else if (state is MoviesTopRatedSuccessState) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.movies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) =>
                      CustomMovieItem(moviesModel: state.movies[index]),
                );
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
                  context.read<TopRatedCubit>().getTopRated(currentPage);
                },
                child: BlocBuilder<TopRatedCubit, TopRatedState>(
                  builder: (context, state) {
                    return CustomPagesNumber(currentPage: currentPage,index: index,);
                  },
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}

