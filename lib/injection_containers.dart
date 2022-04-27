import 'package:get_it/get_it.dart';
import 'package:tarjetas/app/core/injection/auth_injection.dart';
import 'package:tarjetas/app/core/services/api_cliente.dart';

final getIt = GetIt.instance;
void setUpInjectionContainers() {
  authInjection();

  getIt.registerLazySingleton<IApiCliente>(HttpCliente.new);
}
