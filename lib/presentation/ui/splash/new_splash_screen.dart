import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/services/sesion_storage_service.dart';
import 'package:itine/presentation/controllers/auth/session_controller.dart';
import 'package:itine/presentation/controllers/product/cart_controller.dart';
import 'package:itine/presentation/controllers/product/wishlist_controller.dart';
import 'package:itine/presentation/controllers/request/request_controller.dart';
import 'package:itine/presentation/routes/app_routes.dart';

/*class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SessionStorageService storageService = SessionStorageService();
  final RequestController _requestController =
      Get.put(RequestController(), permanent: true);
  final SessionController _sessionController = Get.put(SessionController());
  final WishlistController _wishlistController =
      Get.put(WishlistController(), permanent: true);
  final CartController _cartController =
      Get.put(CartController(), permanent: true);
  bool loading = true;

  @override
  void initState() {
    super.initState();
    checkIsFirstAppLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: loading
          ? const Column()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Titre
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 60, left: 30, bottom: 20),
                          child: const Text(
                            "Cliqué, c'est livré !",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                              padding: const EdgeInsets.only(left: 30),
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      height: 1.4),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          'Nous sommes déjà présents dans plusieurs villes de France tel que : ',
                                    ),
                                    TextSpan(
                                      text:
                                          'Paris, Marseille, Bordeaux, Lille, Lyon',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '.\nVérifiez si votre adresse est éligible et passez votre première commande',
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )),
                // Image
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 50),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/splash_white.png'),
                        // Remplacez avec le chemin de votre image
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // Bouton Continuer
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.addressSearch);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Fond blanc du bouton
                          elevation: 5, // Ombre légère
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: const BorderSide(
                                color: Colors.white38), // Bordure du bouton
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Sélectionnez votre adresse',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  checkIsFirstAppLoad() async {
    bool firstAppLoad = await storageService.isFirstAppLoad();
    setState(() {
      loading = false;
    });

    if (!firstAppLoad) {
      Get.offAllNamed(AppRoutes.main);
    }
  }
}
