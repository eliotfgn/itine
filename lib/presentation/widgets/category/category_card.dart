import 'package:flutter/material.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/domains/models/category/category.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key});

  final Category category = Category(name: 'Nouveautés');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/women/10.jpg'),
          fit: BoxFit.fitWidth,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(25),
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
              '123 articles',
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
