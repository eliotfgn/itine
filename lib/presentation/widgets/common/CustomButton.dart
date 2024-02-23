import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/presentation/controllers/request/request_controller.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    super.key,
    required this.child,
    required this.onTap,
    this.width,
    this.hPadding,
    this.vPadding,
    this.color,
    this.borderColor,
  });

  Widget child;
  final VoidCallback onTap;
  final double? width;
  final double? hPadding;
  final double? vPadding;
  final Color? color;
  final Color? borderColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final RequestController _requestController = Get.find<RequestController>();

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
            side: BorderSide(
              color: widget.borderColor ?? (widget.color ?? AppColors.primary),
              width: 2,
            ),
          ),
          padding: EdgeInsets.symmetric(
              vertical: widget.vPadding ?? 15,
              horizontal: widget.hPadding ?? 10),
          foregroundColor: Colors.white,
        ),
        child: _requestController.isLoading.isTrue == true
            ? const Center(
                child: SpinKitWave(
                  color: Colors.white,
                  size: 20,
                ),
              )
            : widget.child,
      ),
    );
  }
}
