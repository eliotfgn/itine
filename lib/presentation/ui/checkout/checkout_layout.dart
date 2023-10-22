import 'package:flutter/material.dart';
import 'package:itine/core/constants/app_colors.dart';

class CheckoutLayout extends StatelessWidget {
  const CheckoutLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.secondary,
        title: Text('Commande'),
        centerTitle: true,
      ),
    );
  }
}
