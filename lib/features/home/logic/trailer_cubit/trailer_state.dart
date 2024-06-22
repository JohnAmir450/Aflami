part of 'trailer_cubit.dart';

sealed class TrailerState extends Equatable {
  const TrailerState();

  @override
  List<Object> get props => [];
}

final class TrailerInitialState extends TrailerState {}

final class TrailerLoadingState extends TrailerState {}

final class TrailerSuccessState extends TrailerState {
  final TrailerModel trailerModel;

  const TrailerSuccessState({required this.trailerModel});
}

final class TrailerFailureState extends TrailerState {
  final String errorMessage;

  const TrailerFailureState({required this.errorMessage});
}
