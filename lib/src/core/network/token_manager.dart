import 'package:dio/dio.dart';

class TokenManager {
  String? _accessToken;
  String? _refreshToken;

  // These would normally be persisted in secure storage
  void setTokens(String accessToken, String refreshToken) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  String? getAccessToken() {
    return _accessToken;
  }

  String? getRefreshToken() {
    return _refreshToken;
  }

  Future<String?> refreshAccessToken(Dio dio) async {
    try {
      // Make the token refresh request (replace with your actual API call)
      final response = await dio.post(
        '/auth/refresh-token',
        data: {
          'refreshToken': _refreshToken,
        },
      );

      if (response.statusCode == 200) {
        _accessToken = response.data['accessToken'];
        _refreshToken = response.data['refreshToken']; // If refresh token is also updated
        return _accessToken;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
