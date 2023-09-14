import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/widgets/common/CustomTextFormField.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Adresse',
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
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hint: 'Rechercher',
                  visible: true,
                  controller: searchController,
                  leading: const Icon(Icons.search),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
