import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter a valid mail address"));
      } else if (event.passwordValue.length < 5) {
        emit(SignInErrorState("Please enter a valid password"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
