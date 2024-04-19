import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/controllers/auth/session_controller.dart';
import 'package:itine/presentation/routes/app_routes.dart';
import 'package:itine/presentation/widgets/bottom_sheets/logout_bottom_sheet.dart';
import 'package:itine/presentation/widgets/common/CustomButton.dart';

class ProfileItem {
  ProfileItem(this.title, this.icon, [this.color, this.onTap]);

  final String title;
  final Widget icon;
  Color? color;
  VoidCallback? onTap;
}

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final SessionController _sessionController = Get.find<SessionController>();

  List<ProfileItem> items = [
    ProfileItem(
      'Modifier le profil',
      const Icon(Icons.edit_rounded),
    ),
    ProfileItem(
      'Changer le mot de passe',
      const Icon(Icons.key_rounded),
    ),
    ProfileItem(
      'Mes commandes',
      const Icon(Icons.checklist_rounded),
    ),
    ProfileItem(
      'Politique de confidentialité',
      const Icon(Icons.policy_rounded),
    ),
    ProfileItem(
      'Contactez-nous',
      const Icon(Icons.support_agent_rounded),
      null,
      () => Get.toNamed(AppRoutes.chat),
    ),
    ProfileItem(
      'Déconnexion',
      const Icon(Icons.logout_rounded),
      Colors.red.withOpacity(0.65),
      () => Get.bottomSheet(
        LogoutBottomSheet(),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profil',
              style: AppTypography.headline1.copyWith(fontSize: 25),
            ),
            const SizedBox(
              height: 60,
            ),
            _sessionController.isConnected.isTrue
                ? Column(
                    children: [
                      ...items.map(
                        (e) => Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: ListTile(
                            title: Text(
                              e.title,
                              style: AppTypography.headline3
                                  .copyWith(fontSize: 17),
                            ),
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: e.icon,
                              ),
                            ),
                            tileColor: e.color ??
                                AppColors.secondary.withOpacity(0.05),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                            onTap: e.onTap,
                          ),
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Center(
                        child: Text(
                          'Vous êtes actuellement déconnecté. Veuillez vous connecter pour profiter d\'une expérience personalisée.',
                          style: AppTypography.subtitle2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                          : const Text('Votre addresse n\'est pas éligible ')
                    ],
                  )
          ],
        ),
      ),
    ));
  }
}
