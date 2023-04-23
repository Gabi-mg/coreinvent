import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class DioClient {
  static DioClient? _instance;
  static final Dio _dio = Dio();
  static List<Interceptor>? interceptors;

  factory DioClient() => _instance ?? DioClient._internal();

  DioClient._internal() {
    _instance = this;
  }

  void addInterceptors(List<Interceptor> interceptors) {
    _dio
      ..options.connectTimeout = _defaultConnectTimeout as Duration?
      ..options.receiveTimeout = _defaultReceiveTimeout as Duration?
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};
    if (interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    }
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true));
    }
  }

  void addBadCertificateCallBack() {
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  /// Get Dio instance
  Dio getDio() {
    return _dio;
  }
}
