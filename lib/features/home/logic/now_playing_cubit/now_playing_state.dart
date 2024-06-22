part of 'now_playing_cubit.dart';

sealed class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

final class NowPlayingInitialState extends NowPlayingState {}
final class MoviesNowPlayingLoadingState extends NowPlayingState {}

final class MoviesNowPlayingSuccessState extends NowPlayingState {
  final List<MoviesModel>movies;

  const MoviesNowPlayingSuccessState({required this.movies});
}
final class MoviesNowPlayingFailureState extends NowPlayingState {
  final String errorMessage;

  const MoviesNowPlayingFailureState({required this.errorMessage});
}