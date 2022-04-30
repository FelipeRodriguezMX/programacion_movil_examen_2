import 'package:either_dart/either.dart';
import 'package:tarjetas/app/core/errors/failures.dart';
import 'package:tarjetas/app/features/transactions/domain/entities/transaction.dart';

abstract class ITransactionsRepository {
  Future<Either<Failure, List<Transaction>>> getTransactions();
}
