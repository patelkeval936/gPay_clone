import 'package:flutter/material.dart';
import '/model/bank_account.dart';
import '/model/transaction.dart';
import '/values/app_values.dart';
import '../components/password_screen/bank_detail_header.dart';
import '../components/password_screen/error_container.dart';
import '../components/password_screen/number_keyboard.dart';
import '../components/password_screen/password_textfield.dart';
import '../components/password_screen/transaction_detail_background.dart';
import '../components/password_screen/transaction_detail_card.dart';
import '../components/password_screen/transaction_detail_header.dart';
import '../components/password_screen/transaction_info_card.dart';

class PasswordScreen extends StatelessWidget {
  static const id = '/password_screen';
  final BankAccount bankAccount;
  final Transaction transaction;
  const PasswordScreen({Key? key, required this.bankAccount, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const BankDetailHeader(),
                    TransactionDetailHeader(transaction: transaction),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 26),
                      child: PasswordTextField(bankAccount: bankAccount),
                    ),
                    const TransactionInfoCard()
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    ErrorContainer(bankAccount: bankAccount),
                    NumberKeyboard(bankAccount: bankAccount),
                  ],
                ),
              ),
              const TransactionDetailBackground(),
              TransactionDetailsCard(bankAccount: bankAccount, transaction: transaction),
            ],
          ),
        ),
      ),
    );
  }
}
