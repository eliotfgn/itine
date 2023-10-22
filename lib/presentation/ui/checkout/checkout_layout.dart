import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/presentation/controllers/checkout/checkout_navigation_controller.dart';

class CheckoutLayout extends StatelessWidget {
  CheckoutLayout({super.key});

  final CheckoutNavigationController _checkoutNavigationController =
      Get.put(CheckoutNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.secondary,
        title: Text(_checkoutNavigationController
            .titles[_checkoutNavigationController.page.value]),
        centerTitle: true,
      ),
      body: Obx(() => _checkoutNavigationController
          .screens[_checkoutNavigationController.page.value]),
    );
  }
}
