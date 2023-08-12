import 'package:flutter/material.dart';
import '/model/transaction.dart';
import '/values/app_strings.dart';

class TransactionDetailCard extends StatelessWidget {
  const TransactionDetailCard({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Text(AppStrings.getFormattedDate(transaction.time), style: Theme.of(context).textTheme.titleMedium),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(AppStrings.upiTransactionId(transaction.payeeUpiId), style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}