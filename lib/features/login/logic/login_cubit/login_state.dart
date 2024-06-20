part of 'login_cubit.dart';

@immutable
sealed class LoginState  {
  const LoginState();
}

final class LoginInitialState extends LoginState {}
final class LoginSuccessState extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginFailureState extends LoginState 
{
  final String errorMessage;

  const LoginFailureState({required this.errorMessage});
}
final class LoginChangePasswordVisibilityState extends LoginState {}