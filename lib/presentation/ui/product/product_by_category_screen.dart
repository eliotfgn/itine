import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/presentation/controllers/product/products_controller.dart';
import 'package:itine/presentation/controllers/product/sub_category_controller.dart';
import 'package:itine/presentation/widgets/common/custom_app_bar.dart';
import 'package:itine/presentation/widgets/products/product_card.dart';

import '../../widgets/common/CustomTextFormField.dart';

class ProductByCategoryScreen extends StatefulWidget {
  const ProductByCategoryScreen({super.key});

  @override
  State<ProductByCategoryScreen> createState() =>
      _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> {
  bool loading = true;
  final ProductsController _productsController = Get.find<ProductsController>();
  final TextEditingController searchController = TextEditingController();
  final SubCategoryController _subCategoryController =
      Get.find<SubCategoryController>();

  String category = Get.arguments;

  init() async {
    await _productsController.fetchProductsByCategoryAndGender(category);
  }

  @override
  void initState() {
    setState(() {
      loading = false;
    });
    init();
    setState(() {
      loading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => ListView(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
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
                  loading == true
                      ? const Center(
                          child: SpinKitWave(
                            color: AppColors.primary,
                          ),
                        )
                      : Wrap(
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
            ),
            CustomAppBar(
              title: _subCategoryController.activeCategory.value,
            )
          ],
        ),
      ),
    );
  }
}
