import 'dart:async';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:tarjetas/app/core/core_data/data_source/auth_user_data_source.dart';
import 'package:tarjetas/app/core/core_domain/entities/user.dart';
import 'package:tarjetas/app/core/core_domain/repository/auth_user_repository.dart';
import 'package:tarjetas/app/core/errors/failures.dart';
import 'package:tarjetas/app/core/errors/server_exception.dart';

class AuthUserRepositoryImplementation extends IAuthUserRepository {
  AuthUserRepositoryImplementation(this.dataSource);
  final IAuthUserDataSource dataSource;

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final response = await dataSource.getUserData();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.statusCode));
    } on SocketException {
      return const Left(NetworkFailure());
    } on TimeoutException {
      return const Left(TimeOutFailure());
    } catch (e) {
      return const Left(AnotherFailure());
    }
  }
}
