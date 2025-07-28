
import '../../data/models/language_model.dart';

abstract class LanguageRepository {
  Future<List<LanguageModel>> getLanguages();
}