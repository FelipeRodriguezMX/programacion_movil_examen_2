import 'package:tarjetas/app/core/core_domain/entities/card.dart';

class User {
  User({
    required this.name,
    required this.firstLastName,
    required this.secondLastName,
    required this.phone,
    required this.cards,
  });
  final String name;
  final String firstLastName;
  final String secondLastName;
  final String phone;
  final List<CardEntitie> cards;
}
