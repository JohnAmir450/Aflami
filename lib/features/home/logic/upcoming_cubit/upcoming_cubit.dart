import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  final HomeRepo homeRepo;
  int currentPage = 1;

  UpcomingCubit(this.homeRepo) : super(UpcomingInitialState());

  Future<void> getUpcomingMovies(int page) async {
    currentPage = page;
    emit(MoviesUpcomingLoadingState());
    var result = await homeRepo.getUpcoming(page);
    result.fold(
      (failure) => emit(MoviesUpcomingFailureState(errorMessage:  failure.errorMessage)),
      (movies) => emit(MoviesUpcomingSuccessState(movies:  movies)),
    );
  }
}
