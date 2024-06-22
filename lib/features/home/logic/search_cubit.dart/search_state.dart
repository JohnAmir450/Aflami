part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitialState extends SearchState {}

final class SearchLoadingState extends SearchState {}


final class SearchSuccessState extends SearchState {
   final List<MoviesModel>movies;

  const SearchSuccessState({required this.movies});
}

final class SearchFailureState extends SearchState {
  final String errorMessage;

  const SearchFailureState({required this.errorMessage});
}
