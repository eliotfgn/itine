import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/utils/helpers.dart';
import 'package:itine/presentation/routes/app_pages.dart';
import 'package:itine/presentation/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.register,
      //home: RootNavigation(),
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: AppColors.primary,
          primarySwatch: getMaterialColor(AppColors.primary)),
    );
  }
}
