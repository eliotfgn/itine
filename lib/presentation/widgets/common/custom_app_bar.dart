import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_typography.dart';
import 'package:itine/presentation/widgets/common/back_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.onReturn});

  final String title;
  final VoidCallback? onReturn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomBackButton(
            onTap: () {
              if (onReturn != null) {
                onReturn!();
              } else {
                Get.back();
              }
            },
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              title,
              style: AppTypography.headline2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
