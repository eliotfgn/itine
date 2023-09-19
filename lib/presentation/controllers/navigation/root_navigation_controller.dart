import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/presentation/ui/root_navigation/cart_screen.dart';
import 'package:itine/presentation/ui/root_navigation/home.dart';
import 'package:itine/presentation/ui/root_navigation/profile_screen.dart';
import 'package:itine/presentation/ui/root_navigation/wishlist_screen.dart';

class RootNavigationController extends GetxController {
  RxInt pageIndex = 0.obs;

  List<Widget> screens = [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen()
  ];
}
