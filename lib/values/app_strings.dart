
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
  static String minAmountWarning = 'You can not send less than Rs.1';

  static String chooseBankAccount = 'Choose account to pay with';

  static String tapAnywhere = 'Tap anywhere on screen go to Payment Screen';
  static String homeScreen = 'HomeScreen';

  static String pleaseEnterPassword(int digit) => 'Please enter $digit digit password';
  static String youAreTransferringMoneyTo(String name) => 'You are transferring money from your account to $name';
  static String paying(String name) => 'Paying $name';
  static String pay(double amount) => 'Pay ₹$amount';
  static String paidTo(String name) => 'Paid to $name';
  static String upiTransactionId(String id) => 'UPI transaction ID: $id';


  static String monthToString(int month){
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

  static String getFormattedDate(DateTime dateTime) =>
      "${monthToString(dateTime.month)} ${dateTime.day}, ${dateTime.year}"
          " ${dateTime.hour > 10 ? '' : "0"}"
          "${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}:"
          "${dateTime.minute > 10 ? '' : "0"}${dateTime.minute}"
          " ${dateTime.hour > 12 ? 'PM' :"AM"}";

}