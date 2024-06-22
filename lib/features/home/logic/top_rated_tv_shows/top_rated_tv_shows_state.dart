part of 'top_rated_tv_shows_cubit.dart';

sealed class TopRatedTvShowsState extends Equatable {
  const TopRatedTvShowsState();

  @override
  List<Object> get props => [];
}

final class TopRatedTvShowsInitialState extends TopRatedTvShowsState {}

final class TopRatedTvShowsLoadingState extends TopRatedTvShowsState {}

final class TopRatedTvShowsSuccessState extends TopRatedTvShowsState {
  final List<MoviesModel>movies;

  const TopRatedTvShowsSuccessState({required this.movies});
}

final class TopRatedTvShowsFailureState extends TopRatedTvShowsState {
  final String errorMessage;

  const TopRatedTvShowsFailureState({required this.errorMessage});
}
