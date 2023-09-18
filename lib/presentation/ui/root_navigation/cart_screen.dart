import 'package:flutter/material.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/domains/models/product/product.dart';
import 'package:itine/presentation/widgets/common/back_button.dart';
import 'package:itine/presentation/widgets/products/cart_item.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  List<Product> products = [
    Product(
      name: "Robe d'été en lin",
      description:
          'Découvrez notre élégante veste, le choix parfait pour ajouter une touche de style et de chaleur à votre garde-roble. Cette veste allie confort et esthétique avec son design moderne et ses materiaux de haute qualite.',
      price: 67.23,
      cover: 'women/8.jpg',
      categories: ['Nouveautés', 'Populaires', 'Femme'],
      images: [],
      sizes: ['M', 'S', 'L', 'XL', 'XXL'],
      colors: ['F7C600', '12dc3a'],
    ),
    Product(
      name: 'Veste en jean décontractée',
      description:
          'Découvrez notre élégante veste, le choix parfait pour ajouter une touche de style et de chaleur à votre garde-roble. Cette veste allie confort et esthétique avec son design moderne et ses materiaux de haute qualite.',
      price: 67,
      cover: 'men/14.jpg',
      categories: ['Nouveautés', 'Populaires', 'Homme', 'Haut'],
      images: [],
      sizes: ['M', 'S', 'L', 'XL', 'XXL'],
      colors: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                ...products.map((product) => CartItem(product: product))
              ],
            ),
            const CustomBackButton(),
          ],
        ),
      ),
    );
  }
}
