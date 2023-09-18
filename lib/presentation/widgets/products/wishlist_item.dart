import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/domains/models/product/product.dart';
import 'package:itine/presentation/widgets/common/CustomButton.dart';

class WishlistItem extends StatelessWidget {
  WishlistItem({super.key});

  final Product product = Product(
    name: "Robe d'été en lin",
    description:
        'Découvrez notre élégante veste, le choix parfait pour ajouter une touche de style et de chaleur à votre garde-roble. Cette veste allie confort et esthétique avec son design moderne et ses materiaux de haute qualite.',
    price: 67.23,
    cover: 'women/8.jpg',
    categories: ['Nouveautés', 'Populaires', 'Femme'],
    images: [],
    sizes: ['M', 'S', 'L', 'XL', 'XXL'],
    colors: ['F7C600', '12dc3a'],
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id ?? ''),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
              height: 85,
              width: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary,
                image: DecorationImage(
                    image: AssetImage("assets/images/${product.cover}"),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              height: 85,
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
                          product.name,
                          style: AppTypography.headline3.copyWith(fontSize: 17),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Itine France',
                          style: AppTypography.subtitle2.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${product.price} €',
                    style: AppTypography.headline3.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              onTap: () {},
              width: 125,
              vPadding: 5,
              color: AppColors.secondary,
              child: const Text(
                'Ajouter au panier',
                style: TextStyle(fontSize: 11),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
