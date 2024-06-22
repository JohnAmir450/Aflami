import 'package:aflami/features/home/data/models/trailer_model.dart';
import 'package:aflami/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  final HomeRepo homeRepo;
  TrailerCubit(this.homeRepo) : super(TrailerInitialState());

  Future<void> getMovieTrailers(int movieId) async {
    emit(TrailerLoadingState());
    var result = await homeRepo.getMovieTrailer(id:movieId);
    result.fold(
      (failure) => emit(TrailerFailureState(errorMessage:failure.errorMessage)),
      (trailers) => emit(TrailerSuccessState(trailerModel:  trailers)),
    );
  }
}
