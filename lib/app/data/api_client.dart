import 'package:dio/dio.dart';

class ApiClient {
  final baseUrl = 'http://127.0.0.1:8000/api';
  Dio dio = Dio();

  Future<Response> login(String email, String password) async {
    try {
      var response = await dio.post(
        '$baseUrl/login',
        data: {'email': email, 'password': password},
        options: Options(headers: {
          'Accept': 'application/json',
        }),
      );
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var response = await dio.post(
        '$baseUrl/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
        options: Options(headers: {
          'Accept': 'application/json',
        }),
      );
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> logout({required String accessToken}) async {
    try {
      var response = await dio.post(
        '$baseUrl/logout',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> changePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmNewPassword,
      required String accessToken}) async {
    try {
      var response = await dio.put(
        '$baseUrl/change-password',
        data: {
          'current_password': currentPassword,
          'new_password': newPassword,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }
}
