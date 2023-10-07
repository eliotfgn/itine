import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/controllers/product/cart_controller.dart';
import 'package:itine/presentation/widgets/common/back_button.dart';
import 'package:itine/presentation/widgets/products/cart_item.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              children: [
                const SizedBox(
                  height: 65,
                ),
                Text(
                  'Mon panier',
                  style: AppTypography.headline1.copyWith(fontSize: 25),
                ),
                const SizedBox(
                  height: 25,
                ),
                ..._cartController.items.map((item) => CartItemCard(item: item))
              ],
            ),
            const CustomBackButton(),
          ],
        ),
      ),
    );
  }
}
