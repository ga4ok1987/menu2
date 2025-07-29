import '../entities/type_entity.dart';

abstract class TypeRepository {
  Future<List<TypeEntity>> getTypes(String languageCode);
}