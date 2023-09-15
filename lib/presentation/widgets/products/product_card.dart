import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.width * 0.45,
            width: Get.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff704F38).withOpacity(0.7),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/women/1.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xffF1CCA8).withOpacity(0.7),
                    child: const Icon(CupertinoIcons.heart,
                        color: AppColors.secondary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Brown Jacket',
                style: AppTypography.headline4.copyWith(fontSize: 18),
              ),
              const Spacer(),
              const Icon(
                Icons.star_rounded,
                color: Color(0xffFCAF23),
              ),
              Text('4.6')
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            '88 €',
            style: AppTypography.headline3.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
