import 'package:flutter/material.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/constants/app_typography.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    this.label,
    required this.hint,
    required this.visible,
    required this.controller,
    this.leading,
    this.radius,
  });

  final String? label;
  final String hint;
  bool visible;
  final TextEditingController controller;
  final Widget? leading;
  final double? radius;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Text(
                widget.label ?? '',
                style: AppTypography.headline4,
              )
            : const SizedBox(),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 50),
              gapPadding: 10,
              borderSide: const BorderSide(color: AppColors.primary, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 50),
              gapPadding: 10,
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 50),
              gapPadding: 10,
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            hintText: widget.hint,
            hintStyle: AppTypography.hint,
            prefixIcon: widget.leading,
            //suffixIcon: const Icon(Icons.remove_red_eye_sharp),
            alignLabelWithHint: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          style: AppTypography.hint.copyWith(color: Colors.black),
          obscureText: !widget.visible,
          obscuringCharacter: '*',
          controller: widget.controller,
        ),
      ],
    );
  }
}
