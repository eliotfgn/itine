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
        'Authorization':
            'Bearer ${token ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbWluQGl0aW5lLmZyIiwiaWF0IjoxNzA4MDQ2MzU2LCJleHAiOjE3Mzk1ODIzNTZ9.6g8BRhHaOdajwUhULMNT5t2khqukIoaaA-9-IyAikv8'}',
        // Using standard token just for debug
      };
    }

    super.onRequest(options, handler);
  }
}
