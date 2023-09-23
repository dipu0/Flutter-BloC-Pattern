part of 'sign_in_bloc.dart';

abstract class SignInState {}

final class SignInInitialState extends SignInState {}

final class SignInValidState extends SignInState {}

final class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState(this.errorMessage);
}

class SignInLoadingState extends SignInState {}
