import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/domains/models/product/product.dart';
import 'package:itine/presentation/widgets/common/CustomButton.dart';

import '../../widgets/common/back_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final Product product = Get.arguments;
  String selectedColor = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.6,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.4),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    product.images[product.cover - 1],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.40,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5),
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: AppTypography.headline2.copyWith(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Text(
                                      'Itine France',
                                      style: AppTypography.subtitle2,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        RatingBarIndicator(
                                          itemBuilder: (context, index) =>
                                              const Icon(
                                            Icons.star_rounded,
                                            size: 10,
                                            color: Color(0xffFCAF23),
                                          ),
                                          itemSize: 25,
                                          rating: 3.6,
                                          unratedColor: AppColors.secondary
                                              .withOpacity(0.2),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          '(56 avis)',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color:
                                          AppColors.secondary.withOpacity(0.1),
                                    ),
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.remove_rounded,
                                          color: AppColors.secondary,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                              color: AppColors.secondary,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.add_rounded,
                                          color: AppColors.secondary,
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'En stock',
                                    style: AppTypography.headline3.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.secondary,
                                        fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Taille',
                            style:
                                AppTypography.headline2.copyWith(fontSize: 22),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Wrap(
                            children: product.sizes
                                .map(
                                  (size) => Container(
                                    height: 50,
                                    width: 50,
                                    margin: const EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppColors.secondary
                                              .withOpacity(0.2)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        size,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.secondary
                                              .withOpacity(0.6),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Couleur',
                            style:
                                AppTypography.headline2.copyWith(fontSize: 22),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Wrap(
                            children: product.colors.map((color) {
                              int c = int.parse('0xff$color');
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = color;
                                  });
                                },
                                child: Container(
                                  height: 42,
                                  width: 42,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: color == selectedColor
                                        ? Border.all(
                                            color: AppColors.secondary,
                                            width: 2)
                                        : null,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(c),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Description',
                            style:
                                AppTypography.headline2.copyWith(fontSize: 22),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(product.description)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    width: Get.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Prix total'),
                            Text(
                              '${product.price} €',
                              style: AppTypography.headline2
                                  .copyWith(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        CustomButton(
                          onTap: () {},
                          width: Get.width * 0.55,
                          color: AppColors.secondary,
                          hPadding: 25,
                          child: const Row(
                            children: [
                              Icon(Icons.shopping_bag_outlined),
                              const Spacer(),
                              Text('Ajouter au panier'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            CustomBackButton(
              top: 40,
              onTap: Get.back,
            ),
          ],
        ),
      ),
    );
  }
}
