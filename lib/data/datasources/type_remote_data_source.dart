import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/type_model.dart';

@lazySingleton

class TypeRemoteDatasource {
  final SupabaseClient client;

  TypeRemoteDatasource(this.client);

  Future<List<TypeModel>> getTypes(String lang) async {
    final response = await client
        .from('types')
        .select('''
          id,
          code,
          type_translations(name, language_code)
        ''')
        .eq('type_translations.language_code', lang)
        .order('id');

    final data = (response as List).cast<Map<String, dynamic>>();
    return data.map(TypeModel.fromJson).toList();
  }
}