import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/domains/models/category/category.dart';
import 'package:itine/presentation/controllers/product/products_controller.dart';
import 'package:itine/presentation/widgets/products/product_card.dart';

import '../../widgets/common/CustomTextFormField.dart';
import '../../widgets/common/back_button.dart';

class ProductByCategoryScreen extends StatefulWidget {
  const ProductByCategoryScreen({super.key});

  @override
  State<ProductByCategoryScreen> createState() =>
      _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> {
  final ProductsController _productsController = Get.find<ProductsController>();
  final TextEditingController searchController = TextEditingController();

  Category category = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              children: [
                const SizedBox(
                  height: 65,
                ),
                CustomTextFormField(
                  hint: 'Rechercher',
                  visible: true,
                  controller: searchController,
                  leading: const Icon(Icons.search),
                ),
                const SizedBox(
                  height: 30,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 20,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    ..._productsController.products.map(
                          (product) => ProductCard(product: product),
                    )
                  ],
                )
              ],
            ),
            CustomBackButton(
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
