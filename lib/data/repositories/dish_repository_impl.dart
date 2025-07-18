import 'package:injectable/injectable.dart';

import '../../domain/entities/dish.dart';
import '../../domain/repositories/dish_repository.dart';
import '../datasources/dish_data_source.dart';

@LazySingleton(as: DishRepository)
class DishRepositoryImpl implements DishRepository {
  final DishDataSource source;

  DishRepositoryImpl(this.source);


  @override
  Future<List<Dish>> getDishes() async => source.fetchAll();}
