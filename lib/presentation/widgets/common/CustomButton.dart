import 'package:flutter/material.dart';
import 'package:itine/core/constants/app_colors.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    super.key,
    required this.child,
    required this.onTap,
    this.width,
    this.hPadding,
    this.vPadding,
    this.color,
  });

  Widget child;
  final VoidCallback onTap;
  final double? width;
  final double? hPadding;
  final double? vPadding;
  final Color? color;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: widget.color ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(
              vertical: widget.vPadding ?? 15,
              horizontal: widget.hPadding ?? 10),
          foregroundColor: Colors.white,
        ),
        child: widget.child,
      ),
    );
  }
}
