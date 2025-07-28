import 'package:injectable/injectable.dart';

import '../../data/models/language_model.dart';
import '../repositories/language_repository.dart';

@injectable
class GetLanguagesUseCase {
  final LanguageRepository repo;

  GetLanguagesUseCase(this.repo);

  Future<List<LanguageModel>> call() => repo.getLanguages();
}