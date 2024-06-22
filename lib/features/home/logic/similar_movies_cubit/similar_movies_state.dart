part of 'similar_movies_cubit.dart';

sealed class SimilarMoviesState extends Equatable {
  const SimilarMoviesState();

  @override
  List<Object> get props => [];
}

final class SimilarMoviesInitialState extends SimilarMoviesState {}
final class SimilarMoviesLoadingState extends SimilarMoviesState {}
final class SimilarMoviesSuccessState extends SimilarMoviesState {
  final List<MoviesModel>movies;

  const SimilarMoviesSuccessState({required this.movies});
}
final class SimilarMoviesFailureState extends SimilarMoviesState {
  final String errorMessage;

  const SimilarMoviesFailureState({required this.errorMessage});
}
