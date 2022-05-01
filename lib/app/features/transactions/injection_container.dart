import 'package:tarjetas/app/features/transactions/data/data_soruce/transaction_data_source.dart';
import 'package:tarjetas/app/features/transactions/data/repository/transaction_repository.dart';
import 'package:tarjetas/app/features/transactions/domain/repository/transactions_repository.dart';
import 'package:tarjetas/app/features/transactions/domain/usecases/transaction_use_case.dart';
import 'package:tarjetas/injection_containers.dart';

void transactionInjection() {
  getIt
    ..registerLazySingleton<ITransactionsDataSource>(
      () => TransactionDataSourceImplementation(),
    )
    ..registerLazySingleton<ITransactionsRepository>(
      () => TransactionRepositoryImplementation(
        getIt<ITransactionsDataSource>(),
      ),
    )
    ..registerLazySingleton<TransactionUseCase>(
      () => TransactionUseCase(
        getIt<ITransactionsRepository>(),
      ),
    );
}
