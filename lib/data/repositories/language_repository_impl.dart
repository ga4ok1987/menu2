import 'package:injectable/injectable.dart';

import '../../../data/datasources/language_remote_data_source.dart';
import '../../../data/models/language_model.dart';
import '../../domain/repositories/language_repository.dart';

@lazySingleton
class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageRemoteDataSource dataSource;

  LanguageRepositoryImpl(this.dataSource);

  @override
  Future<List<LanguageModel>> getLanguages() {
    return dataSource.getLanguages();
  }
}