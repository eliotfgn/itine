import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/controllers/auth/register_controller.dart';
import 'package:itine/presentation/controllers/request/request_controller.dart';
import 'package:itine/presentation/widgets/common/CustomButton.dart';
import 'package:itine/presentation/widgets/common/CustomTextFormField.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final RequestController _requestController = Get.put(RequestController());
  final RegisterController _registerController = Get.put(RegisterController());

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController townController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
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
                        hint: 'Doe',
                        controller: lastnameController,
                        visible: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        label: 'Prénom',
                        hint: 'John',
                        controller: firstnameController,
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
                        height: 10,
                      ),
                      CustomTextFormField(
                        label: 'Pays',
                        hint: 'France',
                        controller: countryController,
                        visible: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        label: 'Ville',
                        hint: 'Paris',
                        controller: townController,
                        visible: true,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                          width: Get.width,
                          onTap: () {
                            _registerController.register(
                              lastnameController.text,
                              firstnameController.text,
                              emailController.text,
                              passwordController.text,
                              phoneNumberController.text,
                              countryController.text,
                              townController.text,
                            );
                          },
                          child: Text(
                            "S'inscrire",
                            style: AppTypography.subtitle1
                                .copyWith(color: Colors.white),
                          )),
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
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
