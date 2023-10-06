import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/domains/models/product/product.dart';
import 'package:itine/presentation/routes/app_routes.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.productDetails, arguments: widget.product);
      },
      child: SizedBox(
        width: Get.width * 0.40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.width * 0.40,
              width: Get.width * 0.40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff704F38).withOpacity(0.7),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.product.images[widget.product.cover - 1],
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.product.name,
                    style: AppTypography.headline4.copyWith(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Color(0xffFCAF23),
                    ),
                    Text('4.6'),
                  ],
                )
              ],
            ),
            Text(
              '${widget.product.price} €',
              style: AppTypography.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
