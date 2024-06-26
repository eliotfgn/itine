import 'package:get/get.dart';
import 'package:itine/presentation/routes/app_routes.dart';
import 'package:itine/presentation/ui/auth/signin_screen.dart';
import 'package:itine/presentation/ui/auth/signup_screen.dart';
import 'package:itine/presentation/ui/category/categories_screen.dart';
import 'package:itine/presentation/ui/chat/chat_screen.dart';
import 'package:itine/presentation/ui/checkout/checkout_layout.dart';
import 'package:itine/presentation/ui/product/product_by_category_screen.dart';
import 'package:itine/presentation/ui/product/product_details_screen.dart';
import 'package:itine/presentation/ui/root_navigation/root_navigation.dart';
import 'package:itine/presentation/ui/select_location/address_search_page.dart';
import 'package:itine/presentation/ui/splash/new_splash_screen.dart';
import 'package:itine/presentation/ui/sub_category/sub_category_screen.dart';

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
      page: () => const ProductDetailsScreen(),
    ),
    GetPage(
      name: AppRoutes.productsByCategory,
      page: () => const ProductByCategoryScreen(),
    ),
    // GetPage(
    //   name: AppRoutes.splash,
    //   page: () => const SplashScreen(),
    // ),
    GetPage(
      name: AppRoutes.checkout,
      page: () => CheckoutLayout(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.addressSearch,
      page: () => const AddressSearchPage(),
    ),
    GetPage(
      name: AppRoutes.subCategories,
      page: () => const SubCategoryScreen(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const ChatScreen(),
    )
  ];
}
