import 'package:flutter/material.dart';
import 'package:itine/core/constants/app_colors.dart';

class CategoryPill extends StatefulWidget {
  CategoryPill({super.key, required this.name, required this.selected});

  final String name;
  bool selected;

  @override
  State<CategoryPill> createState() => _CategoryPillState();
}

class _CategoryPillState extends State<CategoryPill> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: widget.selected
              ? AppColors.primary
              : AppColors.primary.withOpacity(0.2),
        ),
        color: widget.selected ? AppColors.primary : Colors.transparent,
      ),
      child: Center(
        child: Text(
          widget.name,
          style: TextStyle(
            color: widget.selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
