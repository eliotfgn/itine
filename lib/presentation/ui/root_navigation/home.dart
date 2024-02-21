import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/core/services/api/products/product_service.dart';
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
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Itine',
                style: AppTypography.subtitle2,
              ),
            ],
          ),
          bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              dividerColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              enableFeedback: false,
              labelPadding: const EdgeInsets.symmetric(vertical: 5),
              onTap: (index) {
                _productsController.changeActiveGender(index);
              },
              tabs: const [Text('Homme'), Text('Femme'), Text('Enfant')]),
        ),
        body: TabBarView(
          children: [
            GenderView(
              gender: Gender.man,
            ),
            GenderView(
              gender: Gender.woman,
            ),
            GenderView(
              gender: Gender.child,
            ),
          ],
        ),
      ),
    );
  }
}
