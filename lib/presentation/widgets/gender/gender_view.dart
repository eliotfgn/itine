import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/services/api/products/product_service.dart';
import 'package:itine/presentation/controllers/product/products_controller.dart';
import 'package:itine/presentation/controllers/request/request_controller.dart';
import 'package:itine/presentation/routes/app_routes.dart';

import '../../../domains/models/category/category.dart';
import '../category/category_card.dart';

class GenderView extends StatefulWidget {
  GenderView({super.key, required this.gender});

  final Gender gender;

  @override
  State<GenderView> createState() => _GenderViewState();
}

class _GenderViewState extends State<GenderView> {
  final ProductsController _productsController = Get.put(ProductsController());
  final RequestController _requestController = Get.find<RequestController>();
  List<Category> categories = [];

  init() async {
    categories = await _productsController.fetchCategories(widget.gender);
    setState(() {});
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Obx(
          () => _requestController.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    categories.isNotEmpty
                        ? Column(
                            children: [
                              ...categories.map(
                                (category) => GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.productsByCategory,
                                        arguments: category);
                                  },
                                  child: CategoryCard(category: category),
                                ),
                              ),
                            ],
                          )
                        : const Text('Aucune donnée disponible')
                  ],
                ),
        ),
      ),
    );
  }
}
