import 'package:injectable/injectable.dart';

import '../entities/info_entity.dart';
import '../repositories/info_repository.dart';

@lazySingleton
class GetInfo {
  final InfoRepository repo;

  GetInfo(this.repo);

  Future<InfoEntity> call(String languageCode) {
    return repo.getInfo(languageCode);
  }
}