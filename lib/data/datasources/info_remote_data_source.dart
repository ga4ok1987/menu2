import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/info_model.dart';

@LazySingleton()
class InfoRemoteDataSource {
  final SupabaseClient client;

  InfoRemoteDataSource(this.client);

  Future<InfoModel> getInfo(String languageCode) async {
    final response = await client
        .from('info')
        .select('*, info_translations(*)')
        .maybeSingle();

    if (response == null) throw Exception('No data');

    return InfoModel.fromJson(response);
  }
}