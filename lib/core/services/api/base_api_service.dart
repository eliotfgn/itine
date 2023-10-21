import 'package:dio/dio.dart';
import 'package:itine/core/utils/interceptors/request_logger.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    //baseUrl: 'https://backend-dev-itine.onrender.com',
    baseUrl: 'http://10.0.2.2:8000',
    receiveDataWhenStatusError: true,
  ))
    ..interceptors.addAll([Logger()]);

  Dio get client => _dio;
}
