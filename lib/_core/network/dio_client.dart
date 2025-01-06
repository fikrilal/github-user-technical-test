import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: 'https://api.github.com',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        log('Request[${options.method}] => PATH: ${options.path}', name: 'DioClient');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log('Response[${response.statusCode}] => DATA: ${response.data}', name: 'DioClient');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        log('Error[${e.response?.statusCode}] => MESSAGE: ${e.message}', name: 'DioClient');
        return handler.next(e);
      },
    ));
  }

  static Future<Dio> createDioWithSSLPinning() async {
    final dio = Dio();

    final sslCert = await rootBundle.load('assets/certificates/github.pem');
    dio.httpClientAdapter = IOHttpClientAdapter()
      ..onHttpClientCreate = (HttpClient client) {
        final context = SecurityContext();
        context.setTrustedCertificatesBytes(sslCert.buffer.asUint8List());
        return HttpClient(context: context);
      };

    return dio;
  }

  Dio get dio => _dio;
}
