// API Exception class to handle errors
class ApiException implements Exception {
  final String? message;
  final int? code;

  ApiException({this.message, this.code});

  @override
  String toString() {
    return 'ApiException: $message (code: $code)';
  }
}