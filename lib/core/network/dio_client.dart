import 'package:dio/dio.dart';
import 'dart:io';
import 'package:dio/io.dart';

class DioClient {
  final Dio  dio;

  DioClient(): dio = Dio(BaseOptions(
    baseUrl: 'https://beta.ourmanna.com/api/v1/get', // Replace with your API base URL
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    }
  )) {
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true, requestBody: true
      ));

    // Development-only: accept invalid SSL certificates to avoid handshake errors.
    // IMPORTANT: Remove or guard this in production builds.
    final adapter = IOHttpClientAdapter(createHttpClient: () {
      final client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host, int port) {
        // Optionally restrict to specific hosts:
        // return host == 'beta.ourmanna.com';
        return true; // trust all for dev
      };
      return client;
    });
    dio.httpClientAdapter = adapter;
  }
  
}