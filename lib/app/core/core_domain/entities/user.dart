import 'package:tarjetas/app/core/core_domain/entities/card.dart';

class User {
  User({
    required this.name,
    required this.firstLastName,
    required this.secondLastName,
    required this.phone,
    required this.cards,
    required this.accountNumber,
  });
  String name;
  String firstLastName;
  String secondLastName;
  String phone;
  final int accountNumber;
  final List<CardEntity> cards;
}
