import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/widgets/common/bottom_sheets/logout_bottom_sheet.dart';

class ProfileItem {
  ProfileItem(this.title, this.icon, [this.color, this.onTap]);

  final String title;
  final Widget icon;
  Color? color;
  VoidCallback? onTap;
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  List<ProfileItem> items = [
    ProfileItem(
      'Modifier le profile',
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style: AppTypography.headline1.copyWith(fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          ...items.map(
            (e) => Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: ListTile(
                title: Text(
                  e.title,
                  style: AppTypography.headline3.copyWith(fontSize: 17),
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
                tileColor: e.color ?? AppColors.secondary.withOpacity(0.05),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
                onTap: e.onTap,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
