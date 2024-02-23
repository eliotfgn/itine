import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/controllers/product/cart_controller.dart';
import 'package:itine/presentation/controllers/request/request_controller.dart';
import 'package:itine/presentation/routes/app_routes.dart';
import 'package:itine/presentation/widgets/products/cart_item.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/common/CustomButton.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = false;
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => SizedBox(
          child: isLoading == true
              ? const SpinKitWave(
                  color: AppColors.primary,
                )
              : Stack(
                  children: [
                    ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      children: [
                        Text(
                          'Mon panier',
                          style: AppTypography.headline1.copyWith(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        _cartController.items.isNotEmpty == true
                            ? Column(
                                children: _cartController.items
                                    .map((item) => CartItemCard(item: item))
                                    .toList(),
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.6,
                                    width: Get.width * 0.8,
                                    child: SvgPicture.asset(
                                        'assets/images/empty_cart.svg'),
                                  ),
                                  Text(
                                    'Votre panier est vide.',
                                    style: AppTypography.headline3
                                        .copyWith(color: AppColors.primary),
                                  ),
                                ],
                              ),
                      ],
                    ),
                    _cartController.items.isEmpty
                        ? const SizedBox()
                        : Positioned(
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              color: Colors.white,
                              width: Get.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${_cartController.totalArticles.toString()} ${_cartController.totalArticles > 1 ? 'articles' : 'article'}'),
                                      Text(
                                        '${_cartController.total.toString()} €',
                                        style: AppTypography.headline2.copyWith(
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  CustomButton(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.checkout);
                                    },
                                    width: 150,
                                    color: AppColors.secondary,
                                    hPadding: 25,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Commander'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                  ],
                ),
        ),
      ),
    );
  }
}
