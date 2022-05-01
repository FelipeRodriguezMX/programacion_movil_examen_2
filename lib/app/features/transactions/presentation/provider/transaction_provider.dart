import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tarjetas/app/core/core_presentation/global_states/user_provider.dart';
import 'package:tarjetas/app/core/utils/static_transactions.dart';
import 'package:tarjetas/app/core/utils/utils.dart';
import 'package:tarjetas/app/features/transactions/domain/entities/transaction.dart';
import 'package:tarjetas/app/features/transactions/domain/usecases/transaction_use_case.dart';

class TransactionProvider with ChangeNotifier {
  TransactionProvider() {
    _data = null;
    _userProvider = null;
  }
  List<Transaction>? _data;

  UserProvider? _userProvider;

  List<Transaction>? get data => _data;

  void notify() => notifyListeners();

  bool isEmpty() => _data == null;

  void initData(List<Transaction> data) {
    _data = data;
  }

  void initState({
    required String cardNumber,
    required UserProvider userProvider,
  }) {
    _userProvider = userProvider;
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

  void addTransaction({
    required String card,
    required String amount,
    required int type,
  }) {
    final _amount = double.parse(amount);
    final _transaction = Transaction(
      cardNumber: card,
      amount: _amount,
      type: type == 1 ? 'deposito' : 'envió',
      hora: formateTime(actualTime()),
      fecha: formatDate(actualDate()),
    );
    _userProvider!
        .updateCardTotal(amount: _amount, cardNumber: card, type: type);
    (_data == null) ? _data = [_transaction] : _data!.add(_transaction);
    staticTransactions.add(_transaction);
    notifyListeners();
  }
}
