import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tarjetas/app/core/utils/utils.dart';
import 'package:tarjetas/app/features/transactions/domain/entities/transaction.dart';
import 'package:tarjetas/app/features/transactions/domain/usecases/transaction_use_case.dart';

class TransactionProvider with ChangeNotifier {
  TransactionProvider() {
    _data = null;
  }
  List<Transaction>? _data;

  List<Transaction>? get data => _data;

  void notify() => notifyListeners();

  void initData(List<Transaction> data) {
    _data = data;
  }

  void initState(String cardNumber) {
    _data = null;
    getTransactions(cardNumber: cardNumber);
  }

  void getTransactions({
    required String cardNumber,
    TransactionType? transaction = TransactionType.all,
  }) async {
    final TransactionUseCase _transactionUseCase = GetIt.instance();
    final either = await _transactionUseCase.call(
        transaction: transaction!, cardNumber: cardNumber);
    either.fold(
      (left) => inspect(left),
      (right) => initData(right),
    );
    notifyListeners();
  }
}