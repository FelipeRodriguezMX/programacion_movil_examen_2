import 'package:tarjetas/app/core/core_domain/entities/card.dart';

class CardModel extends CardEntitie {
  CardModel({
    required int accountNumber,
    required double total,
    required int cvi,
    required String cardNumber,
  }) : super(
          accountNumber: accountNumber,
          total: total,
          cvi: cvi,
          cardNumber: cardNumber,
        );

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
      accountNumber: json['accountNumber'],
      total: json['total'].toDouble(),
      cvi: json['cvi'],
      cardNumber: json['cardNumber']);
}
