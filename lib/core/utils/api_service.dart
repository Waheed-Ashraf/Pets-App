import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<List<dynamic>> get({required String endPoint, String? apiKey}) async {
    Map<String, dynamic> headers = {
      'x-api-key': apiKey,
    };
    Response response = await _dio.get(
      endPoint,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }

  //==================================>>>>
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> body,
    required String apiKey,
  }) async {
    Map<String, dynamic> headers = {
      'x-api-key': apiKey,
    };

    Response response = await _dio.post(
      endPoint,
      data: body,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }

  //==================================>>>>
  Future<Map<String, dynamic>> delete({
    required String endPoint,
    required String apiKey,
  }) async {
    Map<String, dynamic> headers = {
      'x-api-key': apiKey,
    };

    Response response = await _dio.delete(
      endPoint,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }
}
