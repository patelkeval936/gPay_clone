import 'package:flutter/material.dart';
import '../../../values/app_assets.dart';
import '../../../values/app_values.dart';
import '../../../values/app_strings.dart';

class BankDetailHeader extends StatelessWidget {
  const BankDetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: width,
      height: 60,
      child: Padding(
        padding: horizontal16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.bankName,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 30, child: Image.asset(AppAssets.upiLogo))
          ],
        ),
      ),
    );
  }
}


