import 'package:either_dart/either.dart';
import 'package:tarjetas/app/core/errors/failures.dart';
import 'package:tarjetas/app/core/utils/utils.dart';
import 'package:tarjetas/app/features/transactions/domain/entities/transaction.dart';
import 'package:tarjetas/app/features/transactions/domain/repository/transactions_repository.dart';

class TransactionUseCase {
  TransactionUseCase(this.repository);
  final ITransactionsRepository repository;

  Future<Either<Failure, List<Transaction>>> call({
    required String cardNumber,
    TransactionType transaction = TransactionType.all,
  }) async {
    final either = await repository.getTransactions();

    return either.fold((left) {
      return Left(left);
    }, (right) {
      switch (transaction) {
        case TransactionType.all:
          return Right(right
              .where((element) => element.cardNumber == cardNumber)
              .toList());
        case TransactionType.deposits:
          return Right(right
              .where(
                (element) =>
                    element.type == 'deposito' &&
                    element.cardNumber == cardNumber,
              )
              .toList());
        case TransactionType.withdraw:
        default:
          return Right(right
              .where((element) =>
                  element.type == 'envió' && element.cardNumber == cardNumber)
              .toList());
      }
    });
  }
}
