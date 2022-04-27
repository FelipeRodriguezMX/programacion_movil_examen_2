import 'package:tarjetas/app/core/core_data/models/user_model.dart';
import 'package:tarjetas/app/core/core_domain/entities/user.dart';
import 'package:tarjetas/app/core/errors/server_exception.dart';
import 'package:tarjetas/app/core/services/api_cliente.dart';

abstract class IAuthUserDataSource {
  Future<User> getUserData();
}

class AuthUserDataSourceImplementation implements IAuthUserDataSource {
  AuthUserDataSourceImplementation({required this.client});
  final IApiCliente client;
  @override
  Future<User> getUserData() async {
    final response = await client.get(file: 'user.json');
    if (response.status == true) {
      return UserModel.fromJson(response.payload);
    }
    throw ServerException(
      statusCode: 1,
      message: 'Error',
    );
  }
}
