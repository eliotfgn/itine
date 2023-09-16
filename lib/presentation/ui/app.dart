import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/utils/helpers.dart';
import 'package:itine/presentation/ui/product/product_details_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: '/signin',
      home: ProductDetailsScreen(),
      //getPages: AppPages.pages,
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: AppColors.primary,
          primarySwatch: getMaterialColor(AppColors.primary)),
    );
  }
}
