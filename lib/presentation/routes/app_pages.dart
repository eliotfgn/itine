import 'package:get/get.dart';
import 'package:itine/presentation/routes/app_routes.dart';
import 'package:itine/presentation/ui/auth/signin_screen.dart';
import 'package:itine/presentation/ui/auth/signup_screen.dart';
import 'package:itine/presentation/ui/category/categories_screen.dart';
import 'package:itine/presentation/ui/checkout/checkout_layout.dart';
import 'package:itine/presentation/ui/product/product_by_category_screen.dart';
import 'package:itine/presentation/ui/product/product_details_screen.dart';
import 'package:itine/presentation/ui/root_navigation/root_navigation.dart';
import 'package:itine/presentation/ui/splash/splash_screen.dart';

class AppPages {
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => SigninScreen(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => RootNavigation(),
    ),
    GetPage(
      name: AppRoutes.categories,
      page: () => CategoriesScreen(),
    ),
    GetPage(
      name: AppRoutes.productDetails,
      page: () => ProductDetailsScreen(),
    ),
    GetPage(
      name: AppRoutes.productsByCategory,
      page: () => const ProductByCategoryScreen(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.checkout,
      page: () => const CheckoutLayout(),
    ),
  ];
}
