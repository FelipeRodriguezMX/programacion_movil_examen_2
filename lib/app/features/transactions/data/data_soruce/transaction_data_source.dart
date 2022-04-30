import 'package:tarjetas/app/core/errors/server_exception.dart';
import 'package:tarjetas/app/core/services/api_cliente.dart';
import 'package:tarjetas/app/features/transactions/data/models/transaction.dart';
import 'package:tarjetas/app/features/transactions/domain/entities/transaction.dart';

abstract class ITransactionsDataSource {
  Future<List<Transaction>> getTransactions();
}

class TransactionDataSourceImplementation implements ITransactionsDataSource {
  TransactionDataSourceImplementation({required this.client});
  final IApiCliente client;
  @override
  Future<List<Transaction>> getTransactions() async {
    final response = await client.get(file: 'transactions.json');
    if (response.status == true) {
      final payload = response.payload as List<dynamic>;
      final data = List<TransactionModel>.from(payload
          .map((x) => TransactionModel.fromJson(x as Map<String, dynamic>)));
      return data;
    }
    throw ServerException(
      statusCode: 1,
      message: 'Error',
    );
  }
}
