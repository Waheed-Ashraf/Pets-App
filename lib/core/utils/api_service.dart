import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<List<dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get(endPoint);

    return response.data;
  }

  //==================================>>>>
  Future<List<T>> post<T>({
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

    return response.data
        .cast<T>(); // Assume T is the expected type of response data
  }
}
