import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tarjetas/app/core/core_data/models/card_model.dart';
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

  bool isEmpty() => _user == null;

  void init(User data) {
    _user = data;
    notifyListeners();
  }

  CardEntity getCard(String cardNumber) =>
      _user!.cards.firstWhere((element) => element.cardNumber == cardNumber);

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

  void addCard({
    required BuildContext context,
    required double total,
    required int cvi,
    required String cardNumber,
  }) {
    final card = CardModel(total: total, cvi: cvi, cardNumber: cardNumber);
    _user!.cards.add(card);
    notifyListeners();
  }

  void updateCardTotal({
    required double amount,
    required String cardNumber,
    required int type,
  }) {
    final index = _user!.cards.indexWhere((e) => e.cardNumber == cardNumber);
    user!.cards[index].total += (type == 1) ? amount : -amount;
    notifyListeners();
  }

  void updateUserData({
    required String name,
    required String fLastName,
    required String sLastName,
    required String phone,
  }) {
    _user!
      ..name = name
      ..firstLastName = fLastName
      ..secondLastName = sLastName
      ..phone = phone;
    notifyListeners();
  }
}
