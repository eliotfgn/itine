import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    super.key,
    required this.child,
    required this.onTap,
    this.width,
  });

  Widget child;
  final VoidCallback onTap;
  final double? width;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
        child: widget.child,
      ),
    );
  }
}
