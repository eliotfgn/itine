// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/controllers/product/cart_controller.dart';
import 'package:itine/presentation/widgets/checkout/address_form.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adresse de livraion',
              style: AppTypography.headline2,
            ),
            const SizedBox(
              height: 20,
            ),
            AddressForm(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Articles commandés',
              style: AppTypography.headline2.copyWith(fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            ..._cartController.items.map((item) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              item.product.images[item.product.cover - 1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.product.name,
                          style: AppTypography.headline3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '(${item.quantity}) ${item.size}',
                          style: AppTypography.headline4.copyWith(
                              color: AppColors.secondary.withOpacity(.7),
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${(item.product.price * item.quantity)} €',
                          style: AppTypography.headline3,
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
