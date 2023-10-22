import 'package:dio/dio.dart';
import 'package:itine/core/services/api/api_endpoints.dart';
import 'package:itine/core/services/api/base_api_service.dart';
import 'package:itine/domains/models/user/user.dart';
import 'package:itine/domains/models/user/user_request.dart';

const String mobileKey =
    'mhXMkMi1zV0Uo1DdQ0K8CeTLuPvVawNPPGTJpjxbLhkqJVpyKqOV258e2TP/4/S';

class AuthService extends ApiService {
  register(UserRequest payload) async {
    Response response =
        await client.post(ApiEndpoints.register, data: payload.toJson());

    return response.statusCode == 200;
  }

  Future<(String, User)?> login(String email, String password) async {
    Response response = await client.post(
      ApiEndpoints.login,
      data: {
        'email': email,
        'password': password,
      },
      options: Options(headers: {'mobile-api-key': mobileKey}),
    );

    if (response.data['success']) {
      return (
        response.data['data']['accessToken'] as String,
        User.fromJson(response.data['user'])
      );
    }
    return null;
  }

  Future<User?> getProfile() async {
    Response response = await client.get(ApiEndpoints.profile);

    User? user = User.fromJson(response.data);

    return user;
  }
}
