import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/controllers/product/products_controller.dart';
import 'package:itine/presentation/controllers/request/request_controller.dart';

import '../../widgets/gender/gender_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  final ProductsController _productsController = Get.put(ProductsController());
  final RequestController _requestController = Get.find<RequestController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          toolbarHeight: 75,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Boutique',
                style: AppTypography.subtitle2,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    height: 30,
                    color: AppColors.primary,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Paris, France',
                    style: AppTypography.headline3,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  )
                ],
              )
            ],
          ),
          bottom: const TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              dividerColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              enableFeedback: false,
              labelPadding: EdgeInsets.symmetric(vertical: 5),
              tabs: [Text('Homme'), Text('Femme'), Text('Enfant')]),
        ),
        body: TabBarView(
          children: [
            GenderView(
              gender: 'man',
            ),
            GenderView(
              gender: 'woman',
            ),
            GenderView(
              gender: 'child',
            ),
          ],
        ),
      ),
    );
  }
}
