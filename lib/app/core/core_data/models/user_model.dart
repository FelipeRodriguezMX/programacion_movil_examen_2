import 'package:tarjetas/app/core/core_domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String name,
    required String firstLastName,
    required String secondLastName,
    required String phone,
  }) : super(
          name: name,
          firstLastName: firstLastName,
          secondLastName: secondLastName,
          phone: phone,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        firstLastName: json['firstLastName'],
        secondLastName: json['secondLastName'],
        phone: json['phone'],
      );
}
