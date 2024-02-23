import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/controllers/auth/session_controller.dart';
import 'package:itine/presentation/routes/app_routes.dart';
import 'package:itine/presentation/widgets/common/CustomButton.dart';

class LogoutBottomSheet extends StatelessWidget {
  LogoutBottomSheet({super.key});

  final SessionController _sessionController = Get.find<SessionController>();

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
            'Déconnexion',
            style: AppTypography.headline3.copyWith(fontSize: 21),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Etes vous sûr de vouloir vous déconnecter?',
            style: AppTypography.subtitle2.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              CustomButton(
                onTap: Get.back,
                width: Get.width * 0.40,
                color: Colors.transparent,
                child: const Text(
                  'Annuler',
                  style: TextStyle(color: AppColors.primary, fontSize: 16),
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  _sessionController
                      .clearSession()
                      .then((value) => Get.offAndToNamed(AppRoutes.login));
                },
                width: Get.width * 0.44,
                child: const Text(
                  'Se déconnecter',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
