import 'package:aflami/core/helpers/errors_alret_dialog.dart';
import 'package:aflami/core/thiming/styles.dart';
import 'package:aflami/core/widgets/custom_arrow_back.dart';
import 'package:aflami/core/widgets/custom_pages_numbers.dart';
import 'package:aflami/features/home/logic/upcoming_cubit/upcoming_cubit.dart';
import 'package:aflami/features/home/ui/widgets/movies_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingMoviesScreen extends StatelessWidget {
  const UpcomingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 40.0.h, left: 15.w),
              child: const Row(
                children: [
                  CustomArrowBack(),
                  Text(
                    'Upcoming Movies',
                    style: TextStyles.font20WhiteSemiBold,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocConsumer<UpcomingCubit, UpcomingState>(
              listenWhen: (previous, current) => current is MoviesUpcomingSuccessState || current is MoviesUpcomingFailureState,
              listener: (context, state) {
                if (state is MoviesUpcomingFailureState) {
                  setupErrorState(context, state.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is MoviesUpcomingLoadingState) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                } else if (state is MoviesUpcomingSuccessState) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.movies.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) => CustomMovieItem(moviesModel: state.movies[index]),
                  );
                } else {
                  return const Text('Unexpected state');
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<UpcomingCubit, UpcomingState>(
              builder: (context, state) {
                var currentPage = context.read<UpcomingCubit>().currentPage;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => GestureDetector(
                      onTap: () {
                        currentPage=index+1;
                        context.read<UpcomingCubit>().getUpcomingMovies(currentPage);
                      },
                      child: CustomPagesNumber(currentPage: currentPage, index: index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
