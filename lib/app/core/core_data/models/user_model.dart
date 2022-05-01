import 'package:tarjetas/app/core/core_data/models/card_model.dart';
import 'package:tarjetas/app/core/core_domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String name,
    required String firstLastName,
    required String secondLastName,
    required String phone,
    required int accountNumber,
    required List<CardModel> cards,
  }) : super(
          name: name,
          firstLastName: firstLastName,
          secondLastName: secondLastName,
          phone: phone,
          cards: cards,
          accountNumber: accountNumber,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        firstLastName: json['firstLastName'],
        secondLastName: json['secondLastName'],
        phone: json['phone'],
        accountNumber: json['accountNumber'],
        cards: List<CardModel>.from(
            json["cards"].map((x) => CardModel.fromJson(x))),
      );
}
