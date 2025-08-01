import 'package:injectable/injectable.dart';
import 'package:menu2/data/models/dish_model.dart';

import '../../domain/entities/dish_entity.dart';
import '../../domain/repositories/dish_repository.dart';
import '../datasources/dish_remote_data_source.dart';

@LazySingleton(as: DishRepository)

class DishRepositoryImpl implements DishRepository {
  final DishRemoteDataSource datasource;


  DishRepositoryImpl(this.datasource) {
    print('DishRepositoryImpl created');
  }


  @override
  Future<List<DishEntity>> getDishes(String languageCode) async {
    try {
      final models = await datasource.getDishes(languageCode);
      return models.map((m) => m.toEntity(languageCode)).toList();
    } catch (e, stack) {
      print('❌ Error in fetchDishes: $e');
      print(stack);
      rethrow;
    }
  }
}