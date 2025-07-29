import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/language_entity.dart';
@lazySingleton
class AvailableLanguagesCubit extends Cubit<List<LanguageEntity>> {
  AvailableLanguagesCubit() : super([]);

  Future<void> loadLanguages() async {
    final response = await Supabase.instance.client
        .from('languages')
        .select(); // або сортуй за priority, name, etc.

    final langs = response.map((row) => LanguageEntity(
      code: row['code'],
      name: row['name'],
    )).toList();

    emit(langs);
  }
}