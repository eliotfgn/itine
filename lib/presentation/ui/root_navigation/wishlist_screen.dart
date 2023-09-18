import 'package:flutter/material.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/widgets/common/back_button.dart';
import 'package:itine/presentation/widgets/products/wishlist_item.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              children: [
                const SizedBox(
                  height: 65,
                ),
                Text(
                  'Ma liste de souhait',
                  style: AppTypography.headline1.copyWith(fontSize: 25),
                ),
                const SizedBox(
                  height: 25,
                ),
                WishlistItem(),
              ],
            ),
            const CustomBackButton(),
          ],
        ),
      ),
    );
  }
}
