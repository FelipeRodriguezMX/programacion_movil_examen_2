class Transaction {
  Transaction({
    required this.cardNumber,
    required this.amount,
    required this.type,
  });

  final String cardNumber;
  final double amount;
  final String type;
}
