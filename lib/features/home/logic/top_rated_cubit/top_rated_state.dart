part of 'top_rated_cubit.dart';

sealed class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

final class MoviesInitialState extends TopRatedState {}

//top rated
final class MoviesTopRatedLoadingState extends TopRatedState {}
final class MoviesTopRatedSuccessState extends TopRatedState {
  final List<MoviesModel>movies;

  const MoviesTopRatedSuccessState({required this.movies});
}
final class MoviesTopRatedFailureState extends TopRatedState {
  final String errorMessage;

  const MoviesTopRatedFailureState({required this.errorMessage});
}




