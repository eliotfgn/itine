import 'package:flutter/material.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/domains/models/product/product.dart';
import 'package:itine/presentation/widgets/common/back_button.dart';
import 'package:itine/presentation/widgets/common/custom_app_bar.dart';
import 'package:itine/presentation/widgets/products/wishlist_item.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  List<Product> products = [];

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
          ...products.map((product) => WishlistItem(product: product))
        ],
      ),
    );
  }
}
