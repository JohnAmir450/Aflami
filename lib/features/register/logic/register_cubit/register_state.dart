part of 'register_cubit.dart';

@immutable
sealed class RegisterState  {
  const RegisterState();

  // @override
  // List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}
final class ChangePasswordVisibilityState extends RegisterState {
  
}


final class RegisterFailureState extends RegisterState {
  final String errorMessage;

  const RegisterFailureState({required this.errorMessage});
}

final class RegisterPickedImageState extends RegisterState {
  final String imagePath;

  const RegisterPickedImageState({required this.imagePath});

 
}

final class RegisterPickedImageFailureState extends RegisterState {
  final String errorMessage;

  const RegisterPickedImageFailureState({required this.errorMessage});
}

final class RegisterCheckBoxState extends RegisterState {
  final bool isChecked;

  const RegisterCheckBoxState({required this.isChecked});
  
}

final class RegisterCheckBoxFalseState extends RegisterState {
  final String errorMessage;

  const RegisterCheckBoxFalseState({required this.errorMessage});
}