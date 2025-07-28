import 'package:flutter/material.dart';
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
            borderRadius: BorderRadius.circular(20),
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
                padding: const EdgeInsets.all(16),
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
                      const SizedBox(height: 8),
                      if (dish.description != null)
                        Text(
                          dish.description!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 4,
                        children: [
                          if (dish.weight != null)
                            Chip(label: Text('Вага: ${dish.weight}')),
                          Chip(label: Text('Ціна: ${dish.price} грн')),
                          if (dish.likes != null)
                            Chip(label: Text('👍 ${dish.likes}')),
                        ],
                      ),
                      const SizedBox(height: 12),
                      if (dish.tagNames.isNotEmpty)
                        Wrap(
                          spacing: 6,
                          children: dish.tagNames
                              .map(
                                (tag) => Chip(
                                  label: Text(tag),
                                  backgroundColor: Colors.grey.withOpacity(0.2),
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
