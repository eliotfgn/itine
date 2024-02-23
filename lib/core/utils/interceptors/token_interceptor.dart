import 'package:dio/dio.dart';
import 'package:itine/core/services/sesion_storage_service.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!(options.path.contains('login') ||
        options.path.contains('register'))) {
      String? token = await SessionStorageService().getToken();
      options.headers = {
        'Authorization': 'Bearer $token',
        // Using standard token just for debug
      };
    }

    super.onRequest(options, handler);
  }
}
