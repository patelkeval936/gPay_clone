import 'package:flutter/material.dart';
import 'package:gpay_clone_for_curie/values/app_strings.dart';
import 'package:gpay_clone_for_curie/values/app_theme.dart';
import 'package:gpay_clone_for_curie/values/app_values.dart';
import 'package:gpay_clone_for_curie/view/screens/password_screen.dart';
import 'package:gpay_clone_for_curie/view/screens/payment_completed_screen.dart';
import 'package:gpay_clone_for_curie/view/screens/payment_screen.dart';

import 'model/transaction.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

Transaction transaction = Transaction(1.00, AppStrings.payeeName, AppStrings.payeeUpiId, DateTime.now(), math.Random().nextInt(9999999).toString());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.theme,
      // home:  PaymentCompletedScreen(transaction: transaction,),
      home:  PasswordScreen(bankAccount: accounts[0], transaction: transaction,),
    );
  }
}

