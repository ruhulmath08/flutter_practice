import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_practice/src/core/network/api_exception.dart';
import 'package:flutter_practice/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_practice/src/features/auth/data/models/login_request_model.dart';
import 'package:flutter_practice/src/features/auth/data/models/user_model.dart';
import 'package:flutter_practice/src/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_practice/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.authRemoteDataSource});

  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<Either<ApiException, UserEntity>> login(
      {required String username, required String password}) async {
    try {
      final Response response = await authRemoteDataSource.login(
        loginRequestModel: LoginRequestModel(
          username: username,
          password: password,
        ),
      );

      UserModel userModel = UserModel.fromJson(response.data);
      return Right(userModel);
    } catch (e, stackTrace) {
      print(stackTrace);
      return Left(ApiException(message: e.toString()));
    }
  }
}
