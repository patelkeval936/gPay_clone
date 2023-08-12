import 'package:flutter/material.dart';
import 'package:gpay_clone_for_curie/view/components/password_screen/payment_info.dart';

import '../../../model/bank_account.dart';
import '../../../model/transaction.dart';
import '../../../values/app_strings.dart';
import '../../../values/app_values.dart';

class BankDetailCard extends StatelessWidget {
  const BankDetailCard({super.key, required this.showPaymentInfo, required this.bankAccount, required this.transaction});

  final bool showPaymentInfo;
  final BankAccount bankAccount;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.white,
      width: width,
      height: !showPaymentInfo ? 0 : 154,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PaymentInfo(
                title: AppStrings.payingTo,
                description: transaction.payeeName,
              ),
              PaymentInfo(
                title: AppStrings.amount,
                description: "${AppStrings.rupeeSymbol} ${transaction.amount.toStringAsFixed(2)}",
              ),
              PaymentInfo(
                title: AppStrings.refID,
                description: transaction.transactionId,
              ),
              PaymentInfo(
                title: AppStrings.account,
                description: "${bankAccount.name} XXXX${bankAccount.accountNumber.substring(AppStrings.accountNumber.length - 4)}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
