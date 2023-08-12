import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/password_cubit.dart';
import '/bloc/password_state.dart';
import '/model/bank_account.dart';
import '/model/transaction.dart';
import '/view/components/password_screen/bank_detail_card.dart';


class TransactionDetailsCard extends StatelessWidget {
  const TransactionDetailsCard({
    super.key,
    required this.bankAccount,
    required this.transaction,
  });

  final BankAccount bankAccount;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 0,
      right: 0,
      child: BlocSelector<PasswordBloc, PasswordState, bool>(
        selector: (state) => state.showPaymentInfo,
        builder: (context, state) {
          return BankDetailCard(
            showPaymentInfo: state,
            bankAccount: bankAccount,
            transaction: transaction,
          );
        },
      ),
    );
  }
}


