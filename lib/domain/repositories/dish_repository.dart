import '../entities/dish.dart';

abstract class DishRepository {
  Future<List<Dish>> getDishes();
}