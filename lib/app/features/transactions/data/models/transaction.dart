import 'package:tarjetas/app/features/transactions/domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  TransactionModel({
    required String cardNumber,
    required double amount,
    required String type,
    required String? fecha,
    required String? hora,
  }) : super(
          cardNumber: cardNumber,
          amount: amount,
          type: type,
          fecha: fecha,
          hora: hora,
        );

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        cardNumber: json["cardNumber"],
        amount: json["amount"].toDouble(),
        type: json["type"],
        fecha: json["fecha"],
        hora: json["hora"],
      );
}
