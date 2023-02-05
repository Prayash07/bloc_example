// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitialState extends SigninState {}

class SigninValidState extends SigninState {}

class SigninErrorState extends SigninState {
  final String errorMessage;
  SigninErrorState({
    required this.errorMessage,
  });
}

class SigninLoadingState extends SigninState {}
