import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/language_model.dart';

@lazySingleton
class LanguageRemoteDataSource {
  final SupabaseClient client;

  LanguageRemoteDataSource(this.client);

  Future<List<LanguageModel>> getLanguages() async {
    final response = await client.from('languages').select();
    return (response as List).map((e) => LanguageModel.fromJson(e)).toList();
  }
}