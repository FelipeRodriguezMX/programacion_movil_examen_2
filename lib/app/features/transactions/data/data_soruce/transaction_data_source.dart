import 'package:tarjetas/app/core/utils/static_transactions.dart';
import 'package:tarjetas/app/features/transactions/domain/entities/transaction.dart';

abstract class ITransactionsDataSource {
  Future<List<Transaction>> getTransactions(String cardNumber);
}

class TransactionDataSourceImplementation implements ITransactionsDataSource {
  @override
  Future<List<Transaction>> getTransactions(String cardNumber) async {
    final cardTransactions = staticTransactions
        .where((element) => element.cardNumber == cardNumber)
        .toList() as List<Transaction>;

    return (cardTransactions.isEmpty) ? [] : cardTransactions;
  }
}
