import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/routes/app_routes.dart';
import 'package:itine/presentation/widgets/common/CustomButton.dart';

import '../../controllers/auth/session_controller.dart';

class NotConnectedBottomSheet extends StatelessWidget {
  NotConnectedBottomSheet({super.key});

  final SessionController _sessionController = Get.find<SessionController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.32,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 238, 234, 234),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Obx(
        () => Column(
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
            _sessionController.userCity.value != ''
                ? CustomButton(
                    onTap: () {
                      Get.offAndToNamed(AppRoutes.login);
                    },
                    width: Get.width,
                    child: const Text(
                      'Se connecter',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : Text('Votre addresse n\'est pas éligible')
          ],
        ),
      ),
    );
  }
}
