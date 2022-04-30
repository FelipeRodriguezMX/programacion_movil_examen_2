class Transaction {
  Transaction({
    required this.id,
    required this.cardNumber,
    required this.amount,
    required this.type,
  });
  final int id;
  final String cardNumber;
  final int amount;
  final String type;
}
