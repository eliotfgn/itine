import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/presentation/controllers/product/sub_category_controller.dart';
import 'package:itine/presentation/routes/app_routes.dart';

import '../../controllers/request/request_controller.dart';
import '../../widgets/common/back_button.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({super.key});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  final RequestController _requestController = Get.find<RequestController>();
  final SubCategoryController _subCategoryController =
      Get.find<SubCategoryController>();
  final TextEditingController searchController = TextEditingController();

  init() async {
    await _subCategoryController.getSubCategories();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => _requestController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 25),
                      children: _subCategoryController.subCategories.isEmpty
                          ? [
                              const Center(
                                child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 50),
                                    child: Text(
                                      'Aucune sous catégorie disponible ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54),
                                    )),
                              )
                            ]
                          : [
                              const SizedBox(
                                height: 60,
                              ),
                              ..._subCategoryController.subCategories
                                  .map((subCategory) => GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              AppRoutes.productsByCategory,
                                              arguments:
                                                  subCategory.categoryName);
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              subCategory.name,
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Divider(
                                                color: Colors
                                                    .grey, // Your desired color
                                                thickness:
                                                    1, // Optional: Adjust thickness
                                                endIndent:
                                                    10 // Optional: Indent from the right
                                                ),
                                          ],
                                        ),
                                      ))
                                  .toList()
                            ],
                    ),
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
