import 'package:aflami/core/networking/constants.dart';
import 'package:aflami/core/widgets/custom_arrow_back.dart';
import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/logic/trailer_cubit/trailer_cubit.dart';
import 'package:aflami/features/home/ui/widgets/movie_details_section.dart';
import 'package:aflami/features/home/ui/widgets/similar_movies_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child: MoviesDetailsSection(year: year, moviesModel: moviesModel),
          ),
          const SliverToBoxAdapter(
            child: SimilarMoviesSection(),
          )
        ],
      ),
    );
  }
}





