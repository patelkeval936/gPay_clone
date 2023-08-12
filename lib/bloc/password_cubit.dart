import 'package:bloc/bloc.dart';
import 'password_state.dart';

class PasswordBloc extends Cubit<PasswordState> {
  PasswordBloc(this.passwordLength)
      : super(
          PasswordState(
            showPassword: false,
            showPaymentInfo: false,
            showError: false,
            currentPointer: 0,
            passwordValues: List.generate(passwordLength, (index) => null),
          ),
        );

  int passwordLength = 0;

  void toggleShowPassword() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void toggleShowPaymentInfo() {
    emit(state.copyWith(showPaymentInfo: !state.showPaymentInfo));
  }

  void toggleShowError() {
    emit(state.copyWith(showError: !state.showError));
  }

  void changeShowPaymentInfoTo(bool value) {
    emit(state.copyWith(showPaymentInfo: value));
  }

  void changeShowErrorTo(bool value) {
    emit(state.copyWith(showError: value));
  }

  void incrementCurrentPointer() {
    state.currentPointer = state.currentPointer + 1;
    emit(state.copyWith(currentPointer: state.currentPointer));
  }

  void decrementCurrentPointer() {
    state.currentPointer = state.currentPointer - 1;
    emit(state.copyWith(currentPointer: state.currentPointer));
  }

  void updatePasswordValue(int index, int? value) {
    state.passwordValues[index] = value;
    emit(state.copyWith(passwordValues: state.passwordValues));
  }
}
