import 'package:get/get.dart';
import 'package:itine/core/services/api/auth/auth_service.dart';
import 'package:itine/core/services/sesion_storage_service.dart';
import 'package:itine/presentation/routes/app_routes.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  final SessionStorageService _sessionStorageService = SessionStorageService();

  login(String email, String password) async {
    String? token = await _authService.login(email, password);

    if (token != null) {
      await _sessionStorageService.saveToken(token);
      Get.toNamed(AppRoutes.main);
    }
  }
}
