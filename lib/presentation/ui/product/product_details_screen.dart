import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/domains/models/product/product.dart';
import 'package:itine/presentation/controllers/auth/session_controller.dart';
import 'package:itine/presentation/controllers/product/products_controller.dart';
import 'package:itine/presentation/controllers/request/request_controller.dart';
import 'package:itine/presentation/widgets/bottom_sheets/not_connected_bottom_sheet.dart';
import 'package:itine/presentation/widgets/common/CustomButton.dart';

import '../../widgets/common/back_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final Product product = Get.arguments;
  String selectedColor = '';
  String size = '';
  int quantity = 1;

  @override
  void initState() {
    setState(() {
      selectedColor = product.colors[0];
      size = product.sizes[0];
    });

    super.initState();
  }

  final ProductsController _productsController = Get.find<ProductsController>();
  final SessionController _sessionController = Get.find<SessionController>();

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
                                    /* Row(
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
                                    ), */
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
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (quantity > 1) {
                                              setState(() {
                                                quantity -= 1;
                                              });
                                            }
                                          },
                                          child: const Icon(
                                            Icons.remove_rounded,
                                            color: AppColors.secondary,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          quantity.toString(),
                                          style: const TextStyle(
                                              color: AppColors.secondary,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              quantity += 1;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.add_rounded,
                                            color: AppColors.secondary,
                                          ),
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
                                AppTypography.headline2.copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Wrap(
                            children: product.sizes
                                .map(
                                  (currentSize) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        size = currentSize;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentSize == size
                                            ? AppColors.secondary
                                            : Colors.transparent,
                                        border: Border.all(
                                            color: currentSize != size
                                                ? AppColors.secondary
                                                    .withOpacity(0.2)
                                                : AppColors.secondary),
                                      ),
                                      child: Center(
                                        child: Text(
                                          currentSize,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: currentSize != size
                                                ? AppColors.secondary
                                                    .withOpacity(0.6)
                                                : Colors.white,
                                          ),
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
                                AppTypography.headline2.copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Wrap(
                            children: product.colors.map((color) {
                              int c = int.parse(
                                  '0xff${color.contains('#') ? color.substring(
                                      1,
                                    ) : color}');
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
                                        border:
                                            color.toLowerCase().contains('fff')
                                                ? Border.all(
                                                    color: AppColors.secondary
                                                        .withOpacity(0.3),
                                                  )
                                                : null,
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
                                AppTypography.headline2.copyWith(fontSize: 18),
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
                            const Text('Prix total'),
                            Text(
                              '${product.price} €',
                              style: AppTypography.headline2
                                  .copyWith(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        CustomButton(
                          onTap: () async {
                            if (_sessionController.isConnected.isTrue) {
                              await _productsController.addToCart(
                                  product.id, quantity, selectedColor, size);
                              setState(() {
                                quantity = 1;
                              });
                              Get.showSnackbar(
                                const GetSnackBar(
                                  message: 'Article ajouté au panier.',
                                  borderRadius: 50,
                                  duration: Duration(seconds: 1),
                                  backgroundColor: AppColors.secondary,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 10,
                                  ),
                                  maxWidth: 250,
                                ),
                              );
                            } else {
                              Get.bottomSheet(NotConnectedBottomSheet());
                            }
                          },
                          width: Get.width * 0.55,
                          color: AppColors.secondary,
                          hPadding: 31,
                          child: const Row(
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                              ),
                              Spacer(),
                              Text(
                                'Ajouter au panier',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 30,
              left: 20,
              child: CustomBackButton(
                top: 40,
                onTap: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
