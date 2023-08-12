import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/values/app_theme.dart';
import '/view/components/payment_screen/processing_payment_card.dart';
import '../../../bloc/payment_cubit.dart';
import '../../../bloc/payment_state.dart';
import 'bank_selection_card.dart';

class PaymentBankSelection extends StatelessWidget {
  const PaymentBankSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: AppTheme.boxShadowDecoration,
        child: Container(
          decoration: AppTheme.roundedBorderDecoration,
          child: AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate,
              child: Column(
                children: [
                  BlocSelector<PaymentBloc, PaymentState, bool>(
                    selector: (state) => state.processingPayment,
                    builder: (context, isProcessingPayment) {
                      if (isProcessingPayment) {
                        return const ProcessingPaymentCard();
                      }
                      return Container();
                    },
                  ),
                  BlocSelector<PaymentBloc, PaymentState, bool>(
                    selector: (state) => state.showBanksCard,
                    builder: (context, showBankCard) {
                      if (showBankCard) {
                        return BankSelectionCard(
                          parentContext: context,
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}