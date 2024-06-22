import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  final HomeRepo homeRepo;
  SimilarMoviesCubit(this.homeRepo) : super(SimilarMoviesInitialState());

  Future<void> getSimilarMovies({required int movieId}) async {
    emit(SimilarMoviesLoadingState());
    var result = await homeRepo.getSimilarMovies(id: movieId);
    result.fold(
        (failure) =>
            emit(SimilarMoviesFailureState(errorMessage: failure.errorMessage)),
        (movies) => emit(SimilarMoviesSuccessState(movies: movies)));
  }
}
