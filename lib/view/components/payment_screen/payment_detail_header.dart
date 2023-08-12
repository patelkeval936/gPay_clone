import 'package:flutter/material.dart';

import '../../../values/app_assets.dart';
import '../../../values/app_strings.dart';

class PaymentDetailHeader extends StatelessWidget {
  const PaymentDetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.lightBlueAccent,
            radius: 35,
            child: Center(
                child: Image.asset(
                  AppAssets.avatar,
                  height: 50,
                )),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(AppStrings.paying(AppStrings.payeeName),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
        Text("(${AppStrings.payeeUpiId})", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),

      ],
    );
  }
}
