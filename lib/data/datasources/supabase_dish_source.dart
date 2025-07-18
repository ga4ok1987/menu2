import 'package:injectable/injectable.dart';
import 'package:menu2/data/models/dish_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


@lazySingleton
class SupabaseDishSource {
  final _client = Supabase.instance.client;

  Future<List<DishModel>> fetchAll() async {
    final response = await _client.from('dishes').select();
    return response.map((json) => DishModel.fromJson(json)).toList();
  }

  Future<DishModel> fetchById(int id) async {
    final result = await _client.from('dishes').select().eq('id', id).single();
    return DishModel.fromJson(result);
  }
}
