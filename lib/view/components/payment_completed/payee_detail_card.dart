import 'package:flutter/material.dart';
import '/values/app_strings.dart';

class PayeeDetailCard extends StatelessWidget {
  const PayeeDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
      child: Column(
        children: [
          Text(AppStrings.paidTo(AppStrings.payeeName),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(AppStrings.payeeUpiId, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}