import 'package:tarjetas/app/features/transactions/domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  TransactionModel({
    required int id,
    required String cardNumber,
    required int amount,
    required String type,
  }) : super(
          id: id,
          cardNumber: cardNumber,
          amount: amount,
          type: type,
        );

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        cardNumber: json["cardNumber"],
        amount: json["amount"],
        type: json["type"],
      );
}
