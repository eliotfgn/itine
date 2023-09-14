import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/widgets/common/CustomButton.dart';
import 'package:itine/presentation/widgets/common/CustomTextFormField.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

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
                const Text('Inscription', style: AppTypography.headline1),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Bienvenu ! Entrez les informations pour créer votre compte.',
                  style: AppTypography.subtitle2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        label: 'Nom',
                        hint: 'John Doe',
                        controller: nameController,
                        visible: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                        height: 10,
                      ),
                      CustomTextFormField(
                        label: 'Numéro de téléphone',
                        hint: '+33 9 129 3901',
                        controller: phoneNumberController,
                        visible: true,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                          child: Text(
                            "S'inscrire",
                            style: AppTypography.subtitle1
                                .copyWith(color: Colors.white),
                          ),
                          onTap: () {}),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                RichText(
                  text: TextSpan(
                    text: "Vous avez déjà un compte? ",
                    style: AppTypography.subtitle2
                        .copyWith(color: Colors.grey.shade800),
                    children: [
                      TextSpan(
                          text: "Connectez-vous",
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
