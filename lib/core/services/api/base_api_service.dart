import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://backend-dev-itine.onrender.com/',
    receiveDataWhenStatusError: true,
  ))
    ..interceptors.addAll([]);

  Dio get client => _dio;
}
