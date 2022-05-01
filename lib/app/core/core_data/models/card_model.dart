import 'package:tarjetas/app/core/core_domain/entities/card.dart';

class CardModel extends CardEntity {
  CardModel({
    required double total,
    required int cvi,
    required String cardNumber,
  }) : super(
          total: total,
          cvi: cvi,
          cardNumber: cardNumber,
        );

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
      total: json['total'].toDouble(),
      cvi: json['cvi'],
      cardNumber: json['cardNumber']);
}
