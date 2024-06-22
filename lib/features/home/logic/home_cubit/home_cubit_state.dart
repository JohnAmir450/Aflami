part of 'home_cubit_cubit.dart';

sealed class HomeState {}

 class HomeCubitInitialState extends HomeState {}

 //class HomeCubitLoadingState extends HomeCubitState {}
 class HomeCubitSuccessState extends HomeState {
  final UserModel userModel;

  HomeCubitSuccessState({required this.userModel});

}
 class HomeCubitFailureState extends HomeState {
  final String errorMessage;

  HomeCubitFailureState({required this.errorMessage});

}