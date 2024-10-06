import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_practice/src/core/constants/app_api_constants.dart';
import 'package:flutter_practice/src/core/network/api_exception.dart';
import 'package:logger/logger.dart';
import 'api_interceptor.dart'; // Import the interceptor
import 'token_manager.dart'; // Import token manager

class ApiService {
  // Singleton instance
  static final ApiService _instance = ApiService._internal();

  late Dio _dio;
  late Logger _logger;
  late TokenManager _tokenManager;

  // Private constructor for singleton
  ApiService._internal() {
    // Initialize Dio and configure options
    _dio = Dio(
      BaseOptions(
        baseUrl: AppApiConstants.baseUrl, // Base URL for API requests
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Initialize the logger
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 3,
        lineLength: 100,
        colors: true,
        // Turn off colors for JSON output
        printEmojis: true,
        // No emojis for clean JSON
        dateTimeFormat: DateTimeFormat.dateAndTime,
      ),
      output: JsonLogOutput(),
    );

    // Initialize the token manager
    _tokenManager = TokenManager();

    // Add the interceptor from the separate file, passing the token manager
    _dio.interceptors.add(ApiInterceptor(_logger, _tokenManager, _dio));
  }

  // Factory constructor to return the singleton instance
  factory ApiService() {
    return _instance;
  }

  // Handle API exceptions and errors
  ApiException _handleError(DioException error) {
    String errorDescription = '';
    if (error.type == DioExceptionType.connectionTimeout) {
      errorDescription = 'Connection Timeout';
    } else if (error.type == DioExceptionType.receiveTimeout) {
      errorDescription = 'Receive Timeout';
    } else if (error.type == DioExceptionType.badResponse) {
      errorDescription =
          'Received invalid status code: ${error.response?.statusCode}';
    } else if (error.type == DioExceptionType.cancel) {
      errorDescription = 'Request to API server was cancelled';
    } else {
      errorDescription = 'Unexpected error occurred';
    }

    return ApiException(
        message: errorDescription, code: error.response?.statusCode);
  }

  // HTTP GET request
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return response.data;
    } on DioException catch (error) {
      throw _handleError(error);
    }
  }

  // HTTP POST request
  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (error) {
      throw _handleError(error);
    }
  }

  // HTTP PUT request
  Future<Response> put(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } on DioException catch (error) {
      throw _handleError(error);
    }
  }

  // HTTP DELETE request
  Future<Response> delete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      return response.data;
    } on DioException catch (error) {
      throw _handleError(error);
    }
  }
}

// Custom JsonLogOutput for structured logging
class JsonLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      if (kDebugMode) {
        print(line);
      } // Print JSON formatted log lines
    }
  }
}
