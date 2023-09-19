import 'package:get/get.dart';
import 'package:itine/presentation/routes/app_routes.dart';
import 'package:itine/presentation/ui/category/categories_screen.dart';
import 'package:itine/presentation/ui/root_navigation/root_navigation.dart';

class AppPages {
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: AppRoutes.main,
      page: () => RootNavigation(),
    ),
    GetPage(
      name: AppRoutes.categories,
      page: () => CategoriesScreen(),
    ),
  ];
}
