import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/presentation/widgets/category/category_card.dart';
import 'package:itine/presentation/widgets/common/CustomTextFormField.dart';
import 'package:itine/presentation/widgets/common/back_button.dart';

import '../../../domains/models/category/category.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  List<Category> categories = [];

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
                CustomTextFormField(
                  hint: 'Rechercher',
                  visible: true,
                  controller: searchController,
                  leading: const Icon(Icons.search),
                ),
                const SizedBox(
                  height: 30,
                ),
                ...categories
                    .map((category) => CategoryCard(category: category))
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
