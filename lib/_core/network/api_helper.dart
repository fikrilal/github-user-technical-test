import 'package:dio/dio.dart';

class ApiHelper {
  final Dio _dio;

  ApiHelper(this._dio);

  Future<Response> getRequest(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postRequest(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> putRequest(String path, {dynamic data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteRequest(String path, {dynamic data}) async {
    try {
      final response = await _dio.delete(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
