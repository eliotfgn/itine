import 'package:get/get.dart';
import 'package:itine/core/services/api/auth/auth_service.dart';
import 'package:itine/core/services/sesion_storage_service.dart';
import 'package:itine/presentation/controllers/auth/session_controller.dart';
import 'package:itine/presentation/routes/app_routes.dart';

import '../../../domains/models/user/user.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  final SessionController _sessionController = Get.put(SessionController());
  final SessionStorageService _sessionStorageService = SessionStorageService();

  login(String email, String password) async {
    (String, User)? res = await _authService.login(email, password);

    if (res?.$1 != null) {
      await _sessionStorageService.saveToken(res!.$1);
      _sessionController.user.value = res.$2;
      Get.toNamed(AppRoutes.main);
    }
  }
}
