import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (event.emailValue == "") {
        emit(
          SigninErrorState(errorMessage: "Please Enter a valid email address"),
        );
      } else if (event.passwordValue.length < 8) {
        emit(SigninErrorState(errorMessage: "Please Enter a valid password"));
      } else {
        emit(SigninValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SigninLoadingState());
    });
  }
}
