import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/dish_tags_model.dart';
import '../models/dish_types_model.dart';

@lazySingleton
class CatalogDataSource {
  final _client = Supabase.instance.client;
  List<DishTypesModel>? _cachedTypes;
  List<DishTagsModel>? _cachedTags;

  Future<List<DishTypesModel>> getTypes() async {
    if (_cachedTypes != null) return _cachedTypes!;
    final response = await _client.from('types').select();
    _cachedTypes = (response as List)
        .map((json) => DishTypesModel.fromJson(json))
        .toList();
    return _cachedTypes!;
  }

  Future<List<DishTagsModel>> getTags() async {
    if (_cachedTags != null) return _cachedTags!;
    final response = await _client.from('tags').select();
    _cachedTags = (response as List)
        .map((json) => DishTagsModel.fromJson(json))
        .toList();
    return _cachedTags!;
  }

  void clearCache() {
    _cachedTypes = null;
    _cachedTags = null;
  }
}
