import 'package:injectable/injectable.dart';

import '../entities/dish.dart';
import '../repositories/dish_repository.dart';

@lazySingleton
class GetDishes {
  final DishRepository repository;
  GetDishes(this.repository);

Future<List<Dish>> call() => repository.getDishes();
}