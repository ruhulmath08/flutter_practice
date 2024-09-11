import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_practice/src/core/constants/app_api_constants.dart';
import 'package:flutter_practice/src/core/network/api_exception.dart';
import 'package:flutter_practice/src/core/network/api_service.dart';
import 'package:flutter_practice/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_practice/src/features/auth/data/models/login_request_model.dart';
import 'package:flutter_practice/src/features/auth/data/models/user_model.dart';
import 'package:flutter_practice/src/features/auth/domain/entities/user_entity.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<Response> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    return await apiService.post(
      AppApiConstants.login,
      data: loginRequestModel.toJson(),
    );
  }
}
