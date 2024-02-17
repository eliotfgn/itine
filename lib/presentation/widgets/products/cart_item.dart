import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/domains/models/cart_item/cart_item.dart';
import 'package:itine/presentation/controllers/product/cart_controller.dart';

class CartItemCard extends StatelessWidget {
  CartItemCard({super.key, required this.item});

  final CartItem item;
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id.toString()),
      direction: DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) async {
        return await _cartController.removeFromCart(item);
      },
      dragStartBehavior: DragStartBehavior.start,
      behavior: HitTestBehavior.deferToChild,
      dismissThresholds: const {DismissDirection.horizontal: 0.9},
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/icons/trash.svg',
              height: 30,
            ),
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(-3, 4), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary,
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        item.product.images[item.product.cover - 1]),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * 0.30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          item.product.name,
                          style: AppTypography.headline3.copyWith(fontSize: 17),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Itine France',
                          style: AppTypography.subtitle2.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${item.product.price} € (${item.quantity})',
                    style: AppTypography.headline3.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
