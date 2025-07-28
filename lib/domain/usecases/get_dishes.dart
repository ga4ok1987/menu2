import 'package:injectable/injectable.dart';

import '../entities/dish_entity.dart';
import '../repositories/dish_repository.dart';
@lazySingleton
class FetchDishesUseCase {
  final DishRepository repository;

  FetchDishesUseCase(this.repository);

  Future<List<DishEntity>> call(String langCode) {
    return repository.fetchDishes(langCode);
  }
}