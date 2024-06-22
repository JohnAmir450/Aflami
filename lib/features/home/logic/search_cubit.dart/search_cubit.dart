import 'package:aflami/features/home/data/models/movies_model.dart';
import 'package:aflami/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepo homeRepo;
  final TextEditingController movieNameController = TextEditingController();

  SearchCubit(this.homeRepo) : super(SearchInitialState());

  Future<void> searchMovies() async {
    if (movieNameController.text.isEmpty ||movieNameController.text=='') {
      emit(SearchInitialState());
      return;
    }

    emit(SearchLoadingState());
    var result = await homeRepo.searchMovies(movieName: movieNameController.text);
    result.fold(
        (failure) => emit(SearchFailureState(errorMessage: failure.errorMessage)),
        (movies) => emit(SearchSuccessState(movies: movies)));
  }

  void onTextChanged(String value) {
    if (value.isEmpty ||value=='') {
      emit(SearchInitialState());
    } else {
      searchMovies();
    }
  }
}
