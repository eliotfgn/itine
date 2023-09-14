import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/presentation/routes/app_pages.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: AppPages.pages,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}

