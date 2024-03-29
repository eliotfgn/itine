import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/core/services/api/products/product_service.dart';
import 'package:itine/core/services/sesion_storage_service.dart';
import 'package:itine/presentation/controllers/auth/session_controller.dart';
import 'package:itine/presentation/controllers/product/products_controller.dart';
import 'package:itine/presentation/controllers/request/request_controller.dart';
import 'package:itine/presentation/routes/app_routes.dart';

import '../../widgets/gender/gender_view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  final ProductsController _productsController = Get.put(ProductsController());

  final SessionController _sessionController = Get.put(SessionController());

  final RequestController _requestController = Get.find<RequestController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _sessionController.getUserCity();
  }

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
          title: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
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
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.addressSearch);
                      },
                      child: Text(
                        _sessionController.userCity.value != ''
                            ? '${_sessionController.userCity.value}, France'
                            : 'Changer votre adresse',
                        style: AppTypography.headline3,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    )
                  ],
                ),
              ],
            ),
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
