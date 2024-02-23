import 'package:get/get.dart';
import 'package:itine/core/services/api/auth/auth_service.dart';
import 'package:itine/core/services/sesion_storage_service.dart';
import 'package:itine/domains/models/user/user.dart';

class SessionController extends GetxController {
  final AuthService _authService = AuthService();
  final SessionStorageService _sessionStorageService = SessionStorageService();

  Rxn<User> user = Rxn<User>();
  RxBool isConnected = false.obs;

  @override
  onInit() async {
    user.value = await _sessionStorageService.getConnectedUser();

    if (user.value == null) {
      isConnected.value = false;
    } else {
      isConnected.value = true;
    }

    super.onInit();
  }

  Future<bool> saveUser() async {
    user.value = await _authService.getProfile();

    if (user.value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> clearSession() async {
    await _sessionStorageService.clearSession();
    user.value = null;
    isConnected.value = false;
  }
}
