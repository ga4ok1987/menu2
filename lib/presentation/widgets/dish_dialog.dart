import 'package:flutter/material.dart';
import 'package:menu2/core/constants/app_sizes.dart';
import 'package:menu2/core/extension/units_localizer.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/entities/dish_entity.dart';

class DishDialog extends StatelessWidget {
  final DishEntity dish;

  const DishDialog({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          constraints: const BoxConstraints(maxHeight: 600),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppBorderRadius.all20,
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: 'dish_${dish.id}',
                child: Image.network(
                  dish.imageUrl ?? '',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: AppPadding.all16,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dish.name ?? '',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AppGaps.gap8,
                      if (dish.description != null)
                        Text(
                          dish.description!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      AppGaps.gap12,
                      Wrap(
                        spacing: 12,
                        runSpacing: 4,
                        children: [
                          if (dish.weight != null)
                            Chip(label: Text('${context.units.weight}: ${dish.weight} ${context.units.grams}')),
                          Chip(label: Text('${context.units.price}: ${dish.price} ${context.units.currency}')),
                          if (dish.likes != null)
                            Chip(label: Text('👍 ${dish.likes}')),
                        ],
                      ),
                      AppGaps.gap12,
                      if (dish.tagNames.isNotEmpty)
                        Wrap(
                          spacing: 6,
                          children: dish.tagNames
                              .map(
                                (tag) => Chip(
                                  label: Text(tag),
                                  backgroundColor: AppColors.grey20,
                                ),
                              )
                              .toList(),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
