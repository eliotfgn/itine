import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/routes/app_routes.dart';
import 'package:itine/presentation/widgets/common/CustomButton.dart';

class NotConnectedBottomSheet extends StatelessWidget {
  const NotConnectedBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 238, 234, 234),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Déconnecté',
            style: AppTypography.headline3.copyWith(fontSize: 21),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Vous êtes actuellement déconnecté. Connectez vous pour interagir avec les produits.',
            style: AppTypography.subtitle2.copyWith(fontSize: 15),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            onTap: () {
              Get.offAndToNamed(AppRoutes.login);
            },
            width: Get.width,
            child: const Text(
              'Se connecter',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
