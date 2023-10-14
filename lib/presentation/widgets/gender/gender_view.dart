import 'package:flutter/material.dart';

import '../../../domains/models/category/category.dart';
import '../category/category_card.dart';

class GenderView extends StatelessWidget {
  GenderView({super.key, required this.gender});

  final String gender;

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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ...categories.map((category) => CategoryCard(category: category))
          ],
        ),
      ),
    );
  }
}
