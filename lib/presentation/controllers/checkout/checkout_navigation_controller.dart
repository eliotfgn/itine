import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:itine/presentation/ui/checkout/checkout_screen.dart';

class ButtonProperties {
  final String title;
  final VoidCallback onTap;

  ButtonProperties(this.title, this.onTap);
}

class CheckoutNavigationController extends GetxController {
  List<String> titles = ['Commande', 'Adresse', 'Paiement', 'Paiement'];
  List<Widget> screens = [CheckoutScreen()];
  List<ButtonProperties> buttons = [];

  @override
  void onInit() {
    buttons = [ButtonProperties('Paiement', _goToPayment)];
    super.onInit();
  }

  RxInt page = 0.obs;

  _goToPayment() {
    page.value = 1;
  }

  makePayment() async {
    Map<String, dynamic>? paymentIntent;
  }
}
