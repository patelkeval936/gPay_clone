import 'package:flutter/material.dart';
import '/model/transaction.dart';
import '/values/app_strings.dart';


class TransactionAmountCard extends StatelessWidget {
  const TransactionAmountCard({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26, bottom: 10),
      child: Text("${AppStrings.rupeeSymbol} ${transaction.amount.toStringAsFixed(2)}",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500)),
    );
  }
}
