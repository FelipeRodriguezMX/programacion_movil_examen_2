class Transaction {
  Transaction({
    required this.cardNumber,
    required this.amount,
    required this.type,
    required this.fecha,
    required this.hora,
  });

  final String cardNumber;
  final double amount;
  final String type;
  final String? fecha;
  final String? hora;
}
