import 'package:tarjetas/app/core/core_data/data_source/auth_user_data_source.dart';
import 'package:tarjetas/app/core/core_data/repositorys/auth_user_repository.dart';
import 'package:tarjetas/app/core/core_domain/repository/auth_user_repository.dart';
import 'package:tarjetas/app/core/core_domain/use_cases/auth_user_use_case.dart';
import 'package:tarjetas/app/core/services/api_cliente.dart';
import 'package:tarjetas/injection_containers.dart';

void authInjection() {
  getIt
    ..registerLazySingleton<IAuthUserDataSource>(
        () => AuthUserDataSourceImplementation(client: getIt<IApiCliente>()))
    ..registerLazySingleton<IAuthUserRepository>(
      () => AuthUserRepositoryImplementation(getIt<IAuthUserDataSource>()),
    )
    ..registerLazySingleton<AuthUserUseCase>(
      () => AuthUserUseCase(
        getIt<IAuthUserRepository>(),
      ),
    );
}
