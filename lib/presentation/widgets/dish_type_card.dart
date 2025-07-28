import 'package:flutter/material.dart';
import 'package:menu2/core/constants/app_colors.dart';

class DishTypeCard extends StatelessWidget {
  final String type;

  const DishTypeCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grey,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Text(
          type,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}