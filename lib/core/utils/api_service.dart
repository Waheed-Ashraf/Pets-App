import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  String baseUrl = 'https://api.thecatapi.com/v1';

  ApiService(this._dio);

  Future<List<dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get("$baseUrl" "$endPoint");

    return response.data;
  }
}
