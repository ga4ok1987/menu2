import 'package:injectable/injectable.dart';

import '../entities/type_entity.dart';
import '../repositories/type_repository.dart';

@injectable
class GetTypesUseCase {
  final TypeRepository repository;

  GetTypesUseCase(this.repository);

  Future<List<TypeEntity>> call(String lang) {
    return repository.getTypes(lang);
  }
}