import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/presentation/controllers/checkout/checkout_navigation_controller.dart';
import 'package:itine/presentation/widgets/common/CustomButton.dart';

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
      bottomSheet: Container(
        height: 100,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          border: Border.all(
            color: AppColors.secondary.withOpacity(.1),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFA5A5A5),
              blurRadius: 10.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              onTap: () {},
              width: Get.width,
              child: Text(
                'Paiement',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
