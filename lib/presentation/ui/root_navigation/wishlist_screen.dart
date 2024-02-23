import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/domains/models/product/product.dart';
import 'package:itine/presentation/controllers/product/wishlist_controller.dart';
import 'package:itine/presentation/widgets/products/wishlist_item.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  List<Product> products = [];
  final WishlistController _wishlistController = Get.find<WishlistController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        children: [
          Text(
            'Ma liste de souhait',
            style: AppTypography.headline1.copyWith(fontSize: 25),
          ),
          const SizedBox(
            height: 25,
          ),
          _wishlistController.items.isNotEmpty
              ? Column(
                  children: [
                    ..._wishlistController.items
                        .map((item) => WishlistItem(product: item.product))
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.6,
                      width: Get.width * 0.8,
                      child:
                          SvgPicture.asset('assets/images/empty_wishlist.svg'),
                    ),
                    Text(
                      'Vous n\'avez aucun produit en favori.',
                      style: AppTypography.headline3.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
