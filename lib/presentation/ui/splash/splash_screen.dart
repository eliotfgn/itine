import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Get.toNamed(AppRoutes.login);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
