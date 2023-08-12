
import 'package:gpay_clone_for_curie/values/app_values.dart';

class AppStrings{
  static String appName = 'GPay';

  static String bankName = 'ICICI Bank';
  static String accountNumber = '87977353788';
  static String payeeUpiId = 'verse@okicici';
  static String payeeName = 'Verse Financials Services';
  static String rupeeSymbol = '₹';
  static String enterUpiPin = 'ENTER UPI PIN';
  static String show = 'SHOW';
  static String hide = 'HIDE';
  static String dismiss = 'DISMISS';
  static String done = 'DONE';

  static String payingTo = 'PAYING TO';
  static String amount = 'AMOUNT';
  static String refID = 'REF ID';
  static String account = 'ACCOUNT';

  static String savingAccount = 'Saving Account';
  static String poweredBy = 'Powered by';

  static String canNotSend = 'You can not send amount more than 1,00,00,000';

  static String chooseBankAccount = 'Choose account to pay with';

  static String pleaseEnterPassword(int digit) => 'Please enter $digit digit password';
  static String youAreTransferringMoneyTo(String name) => 'You are transferring money from your account to $name';
  static String paying(String name) => 'Paying $name';
  static String pay(double amount) => 'Pay ₹$amount';
  static String paidTo(String name) => 'Paid to $name';
  static String upiTransactionId(String id) => 'UPI transaction ID: $id';

  static String getFormattedDate(DateTime dateTime) =>
      "${monthToString(dateTime.month)} ${dateTime.day}, ${dateTime.year}"
          " ${dateTime.hour > 10 ? '' : "0"}"
          "${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}:"
          "${dateTime.minute > 10 ? '' : "0"}${dateTime.minute}"
          " ${dateTime.hour > 12 ? 'PM' :"AM"}";

}