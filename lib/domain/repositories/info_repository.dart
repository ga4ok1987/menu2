import '../entities/info_entity.dart';

abstract class InfoRepository {
  Future<InfoEntity> getInfo(String languageCode);
}
