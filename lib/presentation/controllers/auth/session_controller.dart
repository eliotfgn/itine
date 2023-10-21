import 'package:get/get.dart';
import 'package:itine/core/services/api/auth/auth_service.dart';
import 'package:itine/domains/models/user/user.dart';

class SessionController extends GetxController {
  final AuthService _authService = AuthService();

  Rxn<User> user = Rxn<User>();

  Future<bool> saveUser() async {
    user.value = await _authService.getProfile();

    if (user.value != null) {
      return true;
    } else {
      return false;
    }
  }
}
