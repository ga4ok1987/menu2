import 'package:injectable/injectable.dart';

import '../entities/dish_entity.dart';
import '../repositories/dish_repository.dart';
@lazySingleton
class GetDishesUseCase {
  final DishRepository repository;

  GetDishesUseCase(this.repository);

  Future<List<DishEntity>> call(String langCode) {
    return repository.getDishes(langCode);
  }
}