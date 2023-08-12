import '../model/bank_account.dart';
import 'app_assets.dart';

class AppData {
  static  List<BankAccount> accounts = [
    BankAccount('ICICI', AppAssets.icici, '749237982598',4),
    BankAccount('SBI', AppAssets.sbi, '8902380938',6),
    BankAccount('ICICI', AppAssets.icici, '753478989734',4),
  ];
}