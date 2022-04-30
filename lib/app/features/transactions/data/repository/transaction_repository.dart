import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:tarjetas/app/core/errors/failures.dart';
import 'package:tarjetas/app/core/errors/server_exception.dart';
import 'package:tarjetas/app/features/transactions/data/data_soruce/transaction_data_source.dart';
import 'package:tarjetas/app/features/transactions/domain/entities/transaction.dart';
import 'package:tarjetas/app/features/transactions/domain/repository/transactions_repository.dart';

class TransactionRepositoryImplementation extends ITransactionsRepository {
  TransactionRepositoryImplementation(this.dataSource);
  final ITransactionsDataSource dataSource;

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions() async {
    try {
      final response = await dataSource.getTransactions();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.statusCode));
    } on SocketException {
      return const Left(NetworkFailure());
    } on TimeoutException {
      return const Left(TimeOutFailure());
    } catch (e) {
      inspect(e);
      return const Left(AnotherFailure());
    }
  }
}
