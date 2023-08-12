
import 'bank_account.dart';
import 'transaction.dart';

class ScreenArguments {
  final BankAccount bankAccount;
  final Transaction transaction;

  ScreenArguments(this.bankAccount, this.transaction);
}