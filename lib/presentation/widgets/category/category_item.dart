import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itine/core/constants/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.name, required this.icon});

  final String name;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/$icon.svg',
                fit: BoxFit.contain,
                height: 35,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(name)
        ],
      ),
    );
  }
}
