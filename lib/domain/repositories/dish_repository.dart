import '../entities/dish_entity.dart';

abstract class DishRepository {
  Future<List<DishEntity>> fetchDishes(String languageCode);
}