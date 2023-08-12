import 'package:flutter/material.dart';
import 'package:gpay_clone_for_curie/values/app_assets.dart';

import '../model/bank_account.dart';

Size screenSize = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
double devicePixelRatio = WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
double width = screenSize.width/devicePixelRatio;
double height = screenSize.height/devicePixelRatio;

EdgeInsets horizontal16 = const EdgeInsets.symmetric(horizontal: 16);
EdgeInsets horizontal8 = const EdgeInsets.symmetric(horizontal: 8);

double maxAmountToSend = 10000000;

List<BankAccount> accounts = [
  BankAccount('ICICI', AppAssets.icici, '749237982598',4),
  BankAccount('SBI', AppAssets.sbi, '8902380938',6),
  BankAccount('ICICI', AppAssets.icici, '753478989734',4),
];

String monthToString(int month){
  switch(month){
    case 1 : return 'January';
    case 2 : return 'February';
    case 3 : return 'March';
    case 4 : return 'April';
    case 5 : return 'May';
    case 6 : return 'June';
    case 7 : return 'July';
    case 8 : return 'August';
    case 9 : return 'September';
    case 10 : return 'October';
    case 11 : return 'November';
    case 12 : return 'December';
  }
  return '';
}