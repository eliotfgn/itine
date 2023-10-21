import 'package:get/get.dart';
import 'package:itine/core/services/api/auth/auth_service.dart';
import 'package:itine/domains/models/user/user_request.dart';
import 'package:itine/presentation/routes/app_routes.dart';

class RegisterController extends GetxController {
  final AuthService _authService = AuthService();

  register(String lastName, String firstName, String email, String password,
      String phoneNumber, String country, String town) async {
    if (await _authService.register(UserRequest(firstName, lastName, email,
        password, country, town, int.parse(phoneNumber)))) {
      Get.toNamed(AppRoutes.login);
    }
  }
}
