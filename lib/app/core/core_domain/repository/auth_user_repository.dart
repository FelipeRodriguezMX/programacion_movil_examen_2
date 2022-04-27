import 'package:either_dart/either.dart';
import 'package:tarjetas/app/core/core_domain/entities/user.dart';
import 'package:tarjetas/app/core/errors/failures.dart';

abstract class IAuthUserRepository {
  Future<Either<Failure, User>> getUser();
}
