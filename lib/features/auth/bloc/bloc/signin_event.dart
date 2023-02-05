part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SignInTextChangedEvent extends SigninEvent {
  final String emailValue;
  final String passwordValue;

  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmittedEvent extends SigninEvent {
  final String email;
  final String password;

  SignInSubmittedEvent(this.email, this.password);
}
