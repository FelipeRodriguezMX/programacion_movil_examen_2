import 'package:tarjetas/app/features/transactions/domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  TransactionModel({
    required String cardNumber,
    required double amount,
    required String type,
  }) : super(
          cardNumber: cardNumber,
          amount: amount,
          type: type,
        );

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        cardNumber: json["cardNumber"],
        amount: json["amount"].toDouble(),
        type: json["type"],
      );
}
