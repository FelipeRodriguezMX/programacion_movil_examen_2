class CardEntity {
  CardEntity({
    required this.accountNumber,
    required this.total,
    required this.cvi,
    required this.cardNumber,
  });
  final int accountNumber;
  final double total;
  final int cvi;
  final String cardNumber;
}
