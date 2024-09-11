import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'dart:convert'; // For JSON encoding
import 'token_manager.dart';

class ApiInterceptor extends InterceptorsWrapper {
  final Logger _logger;
  final TokenManager _tokenManager;
  final Dio _dio;

  ApiInterceptor(this._logger, this._tokenManager, this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add the access token to the request header
    String? accessToken = _tokenManager.getAccessToken();
    if (accessToken != null) {
      options.headers["Authorization"] = "Bearer $accessToken";
    }

    final logData = {
      'method': options.method,
      'path': options.path,
      'headers': options.headers,
      'queryParameters': options.queryParameters,
      'data': options.data,
    };
    _logger.i(jsonEncode(logData)); // Log request as JSON
    super.onRequest(options, handler); // Continue with the request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final logData = {
      'statusCode': response.statusCode,
      'data': response.data,
    };
    _logger.i(jsonEncode(logData)); // Log response as JSON
    super.onResponse(response, handler); // Continue with the response
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      _logger.w('Token expired, attempting to refresh');

      // Attempt to refresh the token
      String? newAccessToken = await _tokenManager.refreshAccessToken(_dio);
      if (newAccessToken != null) {
        _logger.i('Token refreshed successfully');

        // Update the authorization header and retry the failed request
        err.requestOptions.headers["Authorization"] = "Bearer $newAccessToken";

        // Clone and retry the request
        final clonedRequest = await _dio.request(
          err.requestOptions.path,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          ),
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );

        return handler.resolve(clonedRequest); // Retry with the new access token
      } else {
        _logger.e('Failed to refresh token');
        return handler.next(err); // Token refresh failed, continue with the error
      }
    } else {
      final logData = {
        'statusCode': err.response?.statusCode,
        'message': err.message,
        'error': err.error.toString(),
      };
      _logger.e(jsonEncode(logData)); // Log error as JSON
      super.onError(err, handler); // Continue with the error
    }
  }
}
