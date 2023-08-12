import 'package:bloc/bloc.dart';
import 'payment_state.dart';

class PaymentBloc extends Cubit<PaymentState> {
  PaymentBloc()
      : super(PaymentState(
          amount: 0.0,
          chooseAccount: false,
          processingPayment: false,
          selectedAccountIndex: 0,
          showBanksCard: false,
        ));

  void changeAmountTo(double amount) {
    emit(state.copyWith(amount: amount));
  }

  void changeProcessingPaymentTo(bool value) {
    emit(state.copyWith(processingPayment: value));
  }

  void changeChooseAccountTo(bool value) {
    emit(state.copyWith(chooseAccount: value));
  }

  void changeSelectedAccountIndexTo(int value) {
    emit(state.copyWith(selectedAccountIndex: value));
  }

  void changeBankShowCardTo(bool value) {
    emit(state.copyWith(showBanksCard: value));
  }

}
