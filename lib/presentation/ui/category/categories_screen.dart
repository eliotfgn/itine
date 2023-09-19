import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/presentation/widgets/category/category_card.dart';
import 'package:itine/presentation/widgets/common/CustomTextFormField.dart';
import 'package:itine/presentation/widgets/common/back_button.dart';

import '../../../domains/models/category/category.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  List<Category> categories = [
    Category(name: 'Nouveautés', image: 'women/11.jpg'),
    Category(name: 'Femme', image: 'women/10.jpg'),
    Category(name: 'Homme', image: 'men/8.jpg'),
    Category(name: 'Robes', image: 'women/9.jpg'),
    Category(name: 'Bas', image: 'pants/1.jpeg'),
    Category(name: 'Chemises', image: 't-shirt/1.jpeg'),
    Category(name: 'T-shirt', image: 'men/2.jpg'),
    Category(name: 'Chaussures', image: 'shoes/1.jpg'),
    Category(name: 'Chapeau', image: 'hats/1.png'),
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
