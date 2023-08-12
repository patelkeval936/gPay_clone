
class PaymentState {

  double amount = 0.0;
  bool chooseAccount = false;
  bool processingPayment = false;
  int selectedAccountIndex = 0;
  bool showBanksCard = false;

  PaymentState({
    required this.amount,
    required this.chooseAccount,
    required this.processingPayment,
    required this.selectedAccountIndex,
    required this.showBanksCard
  });

  PaymentState copyWith({
    double? amount,
    bool? chooseAccount,
    bool? processingPayment,
    int? selectedAccountIndex,
    bool? showBanksCard
  }) {
    return PaymentState(
      amount: amount ?? this.amount,
      chooseAccount: chooseAccount ?? this.chooseAccount,
      processingPayment: processingPayment ?? this.processingPayment,
      selectedAccountIndex: selectedAccountIndex ?? this.selectedAccountIndex,
      showBanksCard: showBanksCard ?? this.showBanksCard
    );
  }

}
