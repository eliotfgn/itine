import 'package:dio/dio.dart';
import 'package:itine/core/utils/interceptors/request_logger.dart';
import 'package:itine/core/utils/interceptors/token_interceptor.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    // baseUrl: 'https://backend-dev-itine.onrender.com', // old server
    //baseUrl: 'https://18.223.181.76:8000', // new server
    baseUrl: 'https://10.0.2.2:8000',
    receiveDataWhenStatusError: true,
  ))
    ..interceptors.addAll([Logger(), TokenInterceptor()]);

  Dio get client => _dio;
}
