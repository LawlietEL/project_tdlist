import 'package:dio/dio.dart';
import 'package:project_tdlist/app/data/api_client.dart';

class TaskApi extends ApiClient {
  Future<Response> addTask({
    required String task,
    required String dueDate,
    required String notification,
    required String accesstoken,
  }) async {
    try {
      var response = await dio.post(
        '$baseUrl/tasks',
        data: {
          'task': task,
          'dueDate': dueDate,
          'notification': notification,
          'tanggal_hari_ini': DateTime.now(),
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $accesstoken',
          },
        ),
      );

      return response;
    } on DioException catch (e) {
      print(e);
      return e.response!;
    }
  }
}
