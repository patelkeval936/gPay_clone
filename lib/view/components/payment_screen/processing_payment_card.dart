import 'package:flutter/material.dart';
import '/values/app_colors.dart';
import '/values/app_strings.dart';

class ProcessingPaymentCard extends StatelessWidget {
  const ProcessingPaymentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: AppColors.buttonColor,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25,bottom: 16,top: 8),
            child: Text(AppStrings.paying(AppStrings.payeeName), style: Theme.of(context).textTheme.titleMedium),
          )
        ],
      ),
    );
  }
}