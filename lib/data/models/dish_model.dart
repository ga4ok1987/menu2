import '../../domain/entities/dish.dart';

class DishModel extends Dish {
  DishModel({
    required super.id,
    required super.title,
    required super.weight,
    required super.ingredients,
    required super.calories,
    required super.price,
    required super.imageUrl,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) => DishModel(
    id: json['id'],
    title: json['title'],
    weight: json['weight'],
    ingredients: json['ingredients'],
    calories: json['calories'],
    price: json['price'],
    imageUrl: json['imageUrl'] ?? '',
  );
}
