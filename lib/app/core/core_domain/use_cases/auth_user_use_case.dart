import 'package:either_dart/either.dart';
import 'package:tarjetas/app/core/core_domain/entities/user.dart';
import 'package:tarjetas/app/core/core_domain/repository/auth_user_repository.dart';
import 'package:tarjetas/app/core/errors/failures.dart';

class AuthUserUseCase {
  AuthUserUseCase(this.repository);
  final IAuthUserRepository repository;

  Future<Either<Failure, User>> call() => repository.getUser();
}
