class Transaction {
  final double amount;
  final String payeeName;
  final String payeeUpiId;
  final DateTime time;
  final String transactionId;

  const Transaction(this.amount, this.payeeName, this.payeeUpiId, this.time, this.transactionId);
}
