import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final HomeRepo homeRepo;
  PopularCubit(this.homeRepo) : super(PopularInitial());



  Future<void>getPopular()async{
    emit(MoviesPopularLoadingState());
    var result = await homeRepo.getPopular();
    result.fold(
      (failure) =>
          emit(MoviesPopularFailureState(errorMessage: failure.errorMessage)),
      (movies) => emit(
        MoviesPopularSuccessState(
          movies: movies,
        ),
      ),
    );
  }
}
