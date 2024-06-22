import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final HomeRepo homeRepo;
  TopRatedCubit(this.homeRepo) : super(MoviesInitialState());

  Future<void> getTopRated(int page) async {
    emit(MoviesTopRatedLoadingState());
    var result = await homeRepo.getTopRated(page);
    result.fold(
      (failure) =>
          emit(MoviesTopRatedFailureState(errorMessage: failure.errorMessage)),
      (movies) => emit(
        MoviesTopRatedSuccessState(
          movies: movies,
        ),
      ),
    );
  }

  
}
