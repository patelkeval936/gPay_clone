import 'package:flutter/material.dart';
import '/values/app_values.dart';
import '/values/app_strings.dart';

class TransactionInfoCard extends StatelessWidget {
  const TransactionInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.8,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: Colors.orangeAccent.withOpacity(0.3)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.info,
              color: Colors.orange,
              size: 30,
            ),
            SizedBox(
              width: width * 0.6,
              child: Text(
                AppStrings.youAreTransferringMoneyTo(AppStrings.payeeName),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
