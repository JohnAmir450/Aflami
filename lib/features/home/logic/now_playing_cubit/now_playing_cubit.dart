import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  final HomeRepo homeRepo;
  NowPlayingCubit(this.homeRepo) : super(NowPlayingInitialState());



   Future<void>getNowPlaying(int page)async{
    emit(MoviesNowPlayingLoadingState());
    var result = await homeRepo.getNowPlaying(page);
    result.fold(
      (failure) =>
          emit(MoviesNowPlayingFailureState(errorMessage: failure.errorMessage)),
      (movies) => emit(
        MoviesNowPlayingSuccessState(
          movies: movies,
        ),
      ),
    );
  }
}
