import 'package:injectable/injectable.dart';

import '../../domain/entities/dish.dart';
import '../../domain/repositories/dish_repository.dart';
import '../datasources/supabase_dish_source.dart';

@LazySingleton(as: DishRepository)
class DishRepositoryImpl implements DishRepository {
  final SupabaseDishSource source;

  DishRepositoryImpl(this.source);


  @override
  Future<List<Dish>> getDishes() async => source.fetchAll();}
