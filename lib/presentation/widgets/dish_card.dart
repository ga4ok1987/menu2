import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../domain/entities/dish.dart';

class DishCard extends StatelessWidget {
  final Dish dish;

  const DishCard({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Card(
        color: AppColors.grey,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dish.title,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${dish.price} грн.',
                          style: const TextStyle(
                            color: AppColors.orange,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          dish.ingredients,
                          style: TextStyle(color: AppColors.white, fontSize: 14),
                        ),
                        Row(
                          children: [
                            Text(
                              '${dish.weight}',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '${dish.calories}',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(

                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        dish.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return CircularProgressIndicator();
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
