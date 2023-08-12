
class PasswordState{
  int currentPointer = 0;
  bool showPassword = false;
  bool showError = false;
  bool showPaymentInfo = false;
  late List<int?> passwordValues;

  PasswordState({
    required this.showPassword,
    required this.showPaymentInfo,
    required this.showError,
    required this.currentPointer,
    required  this.passwordValues,
  });

  PasswordState copyWith({
    bool? showPassword,
    bool? showError,
    bool? showPaymentInfo,
    int? currentPointer,
    List<int?>? passwordValues,
  }) {
    return PasswordState(
        showPassword: showPassword ?? this.showPassword,
        showPaymentInfo: showPaymentInfo ?? this.showPaymentInfo,
        showError: showError ?? this.showError,
        currentPointer: currentPointer ?? this.currentPointer,
        passwordValues: passwordValues ?? this.passwordValues,
    );
  }

}
