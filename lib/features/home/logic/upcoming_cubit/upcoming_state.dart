part of 'upcoming_cubit.dart';

sealed class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

final class UpcomingInitialState extends UpcomingState {}
final class MoviesUpcomingLoadingState extends UpcomingState {}

final class MoviesUpcomingSuccessState extends UpcomingState {
  final List<MoviesModel>movies;

  const MoviesUpcomingSuccessState({required this.movies});
}
final class MoviesUpcomingFailureState extends UpcomingState {
  final String errorMessage;

  const MoviesUpcomingFailureState({required this.errorMessage});
}