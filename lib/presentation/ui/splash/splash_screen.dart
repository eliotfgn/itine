import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/presentation/controllers/auth/session_controller.dart';
import 'package:itine/presentation/controllers/request/request_controller.dart';
import 'package:itine/presentation/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final RequestController _requestController =
      Get.put(RequestController(), permanent: true);
  final SessionController _sessionController =
      Get.put(SessionController(), permanent: true);

  init() async {
    bool authenticated = await _sessionController.saveUser();

    if (authenticated) {
      Get.toNamed(AppRoutes.main);
    } else {
      Get.toNamed(AppRoutes.login);
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
