import 'package:flutter/material.dart';
import 'package:menu2/core/extension/units_localizer.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../domain/entities/dish_entity.dart';
import 'dish_dialog.dart';

class DishCard extends StatelessWidget {
  final DishEntity dish;

  const DishCard({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierLabel: "Dish Detail",
          barrierDismissible: true,
          barrierColor: Colors.black54,
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (_, __, ___) => DishDialog(dish: dish),
          transitionBuilder: (_, anim, __, child) {
            return FadeTransition(
              opacity: CurvedAnimation(parent: anim, curve: Curves.easeOut),
              child: child,
            );
          },
        );
      },
      child: Container(
        margin: AppPadding.hor16ver8,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: AppBorderRadius.all16,
          boxShadow: const [
            BoxShadow(
              color: AppColors.black,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: AppPadding.all8,
                child: ClipRRect(
                  borderRadius: AppBorderRadius.top16bot16,
                  child: AspectRatio(
                    aspectRatio: 5/4,
                    child: Hero(
                      tag: 'dish_${dish.id}',
                      child: Image.network(
                        dish.imageUrl ?? '',

                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppColors.grey30,
                          child: const Icon(Icons.image, size: 40),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: AppPadding.all12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dish.name ?? '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppGaps.gap4,
                    Text(
                      dish.description ?? '',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: AppColors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppGaps.gap8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${dish.price.toStringAsFixed(2)} ${context.units.currency}',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          '${dish.weight} ${context.units.grams}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
