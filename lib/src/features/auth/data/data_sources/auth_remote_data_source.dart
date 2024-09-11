import 'package:dio/dio.dart';
import 'package:flutter_practice/src/features/auth/data/models/login_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<Response> login({
    required LoginRequestModel loginRequestModel,
  });
}
