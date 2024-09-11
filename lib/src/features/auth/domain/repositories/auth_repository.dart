import 'package:dartz/dartz.dart';
import 'package:flutter_practice/src/core/network/api_exception.dart';
import 'package:flutter_practice/src/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<ApiException, UserEntity>> login({
    required String username,
    required String password,
  });
}
