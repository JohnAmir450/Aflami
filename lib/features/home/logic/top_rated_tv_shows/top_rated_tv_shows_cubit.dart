import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'top_rated_tv_shows_state.dart';

class TopRatedTvShowsCubit extends Cubit<TopRatedTvShowsState> {
   final HomeRepo homeRepo;
  TopRatedTvShowsCubit(this.homeRepo) : super(TopRatedTvShowsInitialState());


  Future<void>getTopRatedTVShows()async{
    emit(TopRatedTvShowsLoadingState());
    var result = await homeRepo.getTopRatedTVShows();
    result.fold(
      (failure) =>
          emit(TopRatedTvShowsFailureState(errorMessage: failure.errorMessage)),
      (movies) => emit(
        TopRatedTvShowsSuccessState(
          movies: movies,
        ),
      ),
    );
  }
}
