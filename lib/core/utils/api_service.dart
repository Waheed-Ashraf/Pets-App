import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  String baseUrl = 'http://www.themealdb.com/api/json/v1/1/';

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get("$baseUrl" "$endPoint");

    return response.data;
  }
}
