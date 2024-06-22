part of 'popular_cubit.dart';

sealed class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

final class PopularInitial extends PopularState {}
final class MoviesPopularLoadingState extends PopularState {}

final class MoviesPopularSuccessState extends PopularState {
  final List<MoviesModel>movies;

  const MoviesPopularSuccessState({required this.movies});
}
final class MoviesPopularFailureState extends PopularState {
  final String errorMessage;

  const MoviesPopularFailureState({required this.errorMessage});
}
