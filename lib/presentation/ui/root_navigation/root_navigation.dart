import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/presentation/controllers/auth/session_controller.dart';
import 'package:itine/presentation/controllers/navigation/root_navigation_controller.dart';
import 'package:itine/presentation/widgets/common/navigation_bar.dart';

class RootNavigation extends StatelessWidget {
  RootNavigation({super.key});

  final RootNavigationController navigationController =
      Get.put(RootNavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body:
            navigationController.screens[navigationController.pageIndex.value],
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
