import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:itine/presentation/ui/checkout/checkout_screen.dart';

class CheckoutNavigationController extends GetxController {
  List<String> titles = ['Commande', 'Adresse', 'Paiement', 'Paiement'];
  List<Widget> screens = [CheckoutScreen()];

  RxInt page = 0.obs;
}