import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/dish_model.dart';

@lazySingleton
class DishRemoteDataSource {
  final SupabaseClient client;

  DishRemoteDataSource(this.client);

  Future<List<DishModel>> getDishes(String lang) async {

    final response = await client
        .from('dishes')
        .select('''
          id,
          image_url,
          price,
          weight,
          likes,
          dish_translations!inner(language_code,name,description),
          types(type_translations(name, language_code)),
          dish_tags(
            tags(tag_translations!inner(language_code,name))
          )
        ''')
        .eq('dish_translations.language_code', lang)
        .eq('types.type_translations.language_code', lang)
        .order('id');

    final data = response as List;
    return data.map((json) => DishModel.fromJson(json)).toList();

  }
}