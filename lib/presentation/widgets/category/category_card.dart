import 'package:flutter/material.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/domains/models/category/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(category.image ?? ''),
          fit: BoxFit.fitWidth,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.name,
              style: AppTypography.headline1.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 23,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 0),
            Text(
              '${category.count} ${category.count > 1 ? 'articles' : 'article'}',
              style: AppTypography.subtitle1.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
