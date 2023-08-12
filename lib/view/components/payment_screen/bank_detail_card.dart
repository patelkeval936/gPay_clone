import 'package:flutter/material.dart';
import 'package:gpay_clone_for_curie/values/app_colors.dart';
import '../../../values/app_strings.dart';
import 'package:gpay_clone_for_curie/model/bank_account.dart';

class BankDetailCard extends StatelessWidget {
  final int cardIndex;
  final int selectedIndex;
  final bool chooseAccount;
  final BankAccount bankAccount;

  const BankDetailCard({Key? key, required this.cardIndex, required this.selectedIndex, required this.bankAccount, required this.chooseAccount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
              height: 54,
              width: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                child: Image.asset(
                  bankAccount.logo,
                  height: 50,
                  width: 50,
                ),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${bankAccount.name} ••••${bankAccount.accountNumber.substring(bankAccount.accountNumber.length - 4)}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    AppStrings.savingAccount,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          !chooseAccount ? Icon(Icons.keyboard_arrow_down_rounded) : Container(),
          chooseAccount && selectedIndex == cardIndex
              ? Icon(
                  Icons.check_circle_rounded,
                  color: Colors.blueAccent,
                )
              : Container(),
        ],
      ),
    );
  }
}
