import 'package:dartz/dartz.dart';
import 'package:flutter_practice/src/core/network/api_exception.dart';
import 'package:flutter_practice/src/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_practice/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  const LoginUseCase({required this.repository});

  final AuthRepository repository;

  Future<Either<ApiException, UserEntity>> execute({
    required String username,
    required String password,
  }) async {
    return await repository.login(username: username, password: password);
  }
}
