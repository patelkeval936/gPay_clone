// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/model/screen_arguments.dart';
import '/values/app_values.dart';
import '/values/app_strings.dart';
import '/view/screens/password_screen.dart';
import '/view/screens/payment_completed_screen.dart';
import 'dart:math' as math;
import '../../../bloc/payment_cubit.dart';
import '../../../bloc/payment_state.dart';
import '../../../model/transaction.dart';
import '../../../values/app_data.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({Key? key, required this.parentContext}) : super(key: key);

  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          onPressed: () async {

            if (context.read<PaymentBloc>().state.amount < 1) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(AppStrings.minAmountWarning),
                ),
              );
            } else {

              double amount = parentContext.read<PaymentBloc>().state.amount;
              int selectedAccountIndex = context.read<PaymentBloc>().state.selectedAccountIndex;

              Transaction transaction = Transaction(
                amount,
                AppStrings.payeeName,
                AppStrings.payeeUpiId,
                DateTime.now(),
                math.Random().nextInt(99999999).toString(),
              );

              context.read<PaymentBloc>().changeBankShowCardTo(false);
              context.read<PaymentBloc>().changeProcessingPaymentTo(true);

              await Future.delayed(const Duration(seconds: 4));

              await Navigator.of(parentContext).pushNamed(
                PasswordScreen.id,
                arguments: ScreenArguments(
                  AppData.accounts[selectedAccountIndex],
                  transaction,
                ),
              );

              await Future.delayed(const Duration(seconds: 3));

              await Navigator.of(parentContext).pushReplacementNamed(
                PaymentCompletedScreen.id,
                arguments: transaction,
              );
            }
          },
          child: BlocSelector<PaymentBloc, PaymentState, double>(
            selector: (state) => state.amount,
            builder: (context, state) {
              return Text(AppStrings.pay(state));
            },
          ),
        ),
      ),
    );
  }
}
