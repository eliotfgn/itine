import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/widgets/common/CustomButton.dart';
import 'package:itine/presentation/widgets/common/CustomTextFormField.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SizedBox(
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Text('Connexion', style: AppTypography.headline1),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Bon retour! Entrez vos informations de connection.',
                  style: AppTypography.subtitle2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        label: 'Email',
                        hint: 'exemple@gmail.com',
                        controller: emailController,
                        visible: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        label: 'Mot de passe',
                        hint: '**********',
                        controller: passwordController,
                        visible: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Mot de passe oublié',
                            style: AppTypography.subtitle2.copyWith(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomButton(
                          child: Text(
                            'Se connecter',
                            style: AppTypography.subtitle1
                                .copyWith(color: Colors.white),
                          ),
                          width: Get.width,
                          onTap: () {}),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                RichText(
                  text: TextSpan(
                    text: "Vous n'avez pas encore de compte? ",
                    style: AppTypography.subtitle2
                        .copyWith(color: Colors.grey.shade800),
                    children: [
                      TextSpan(
                          text: "Inscrivez-vous",
                          style: AppTypography.subtitle2
                              .copyWith(color: AppColors.primary)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
