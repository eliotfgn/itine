import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/domains/models/product/product.dart';
import 'package:itine/presentation/controllers/auth/session_controller.dart';
import 'package:itine/presentation/controllers/product/products_controller.dart';
import 'package:itine/presentation/controllers/product/wishlist_controller.dart';
import 'package:itine/presentation/routes/app_routes.dart';
import 'package:itine/presentation/widgets/bottom_sheets/not_connected_bottom_sheet.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool liked = false;

  final ProductsController _productsController = Get.find<ProductsController>();
  final WishlistController _wishlistController = Get.find<WishlistController>();
  final SessionController _sessionController = Get.find<SessionController>();

  @override
  void initState() {
    setState(() {
      liked = _wishlistController.hasLiked(widget.product.id);
    });
    super.initState();
  }

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
                    child: CachedNetworkImage(
                      imageUrl: widget.product.images[widget.product.cover - 1],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: Text('Itine'),
                      ),
                      alignment: Alignment.topCenter,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: () async {
                        if (_sessionController.isConnected.isTrue) {
                          liked = await _wishlistController
                              .handleLikeButton(widget.product.id);
                          setState(() {});
                        } else {
                          Get.bottomSheet(NotConnectedBottomSheet());
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            const Color(0xffF1CCA8).withOpacity(0.7),
                        child: Icon(
                            liked
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: AppColors.secondary),
                      ),
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
                /* const Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Color(0xffFCAF23),
                    ),
                    Text('4.6'),
                  ],
                ) */
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
