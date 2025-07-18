import 'package:injectable/injectable.dart';
import 'package:menu2/data/models/dish_model.dart';
import 'package:menu2/data/models/dish_types_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


@lazySingleton
class DishDataSource {
  final _client = Supabase.instance.client;

  Future<List<DishModel>> fetchAll() async {
    final response = await _client.from('dishes').select();
    return response.map((json) => DishModel.fromJson(json)).toList();
  }

  Future<List<DishTypesModel>> fetchAllTypes() async {
    final response = await _client.from('types').select();
    return response.map((json) => DishTypesModel.fromJson(json)).toList();
  }
}
