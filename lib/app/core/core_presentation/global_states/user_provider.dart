import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tarjetas/app/core/core_domain/entities/card.dart';
import 'package:tarjetas/app/core/core_domain/entities/user.dart';
import 'package:tarjetas/app/core/core_domain/use_cases/auth_user_use_case.dart';

class UserProvider with ChangeNotifier {
  UserProvider() {
    _user = null;
  }
  User? _user;

  User? get user => _user;

  void notify() => notifyListeners();

  void init(User data) {
    _user = data;
    notifyListeners();
  }

  void login(BuildContext context) async {
    final AuthUserUseCase _authUseCase = GetIt.instance();
    final either = await _authUseCase.call();
    either.fold((left) {
      inspect(left);
    }, (right) {
      init(right);
      Navigator.of(context).pushNamed('/home');
    });
  }

  CardEntity getCard(String cardNumber) =>
      _user!.cards.firstWhere((element) => element.cardNumber == cardNumber);
}
