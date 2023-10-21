import 'package:dio/dio.dart';
import 'package:itine/core/services/api/api_endpoints.dart';
import 'package:itine/core/services/api/base_api_service.dart';
import 'package:itine/domains/models/user/user_request.dart';
import 'package:itine/presentation/routes/app_routes.dart';

class AuthService extends ApiService {
  register(UserRequest payload) async {
    Response response =
        await client.post(ApiEndpoints.register, data: payload.toJson());

    return response.statusCode == 200;
  }

  login(String email, String password) async {
    Response response = await client.post(AppRoutes.login, data: {
      'email': email,
      'password': password,
    });
  }
}
