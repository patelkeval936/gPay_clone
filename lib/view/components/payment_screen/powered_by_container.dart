import 'package:flutter/material.dart';
import '/values/app_assets.dart';
import '/values/app_strings.dart';


class PoweredByContainer extends StatelessWidget {
  const PoweredByContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            AppStrings.poweredBy,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4,bottom: 20),
          child: Center(
              child: Image.asset(
                AppAssets.upiLogo,
                height: 20,
              )),
        )
      ],
    );
  }
}