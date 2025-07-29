import 'package:injectable/injectable.dart';
import 'package:menu2/data/models/type_model.dart';

import '../../domain/entities/type_entity.dart';
import '../../domain/repositories/type_repository.dart';
import '../datasources/type_remote_data_source.dart';

@LazySingleton(as: TypeRepository)
class TypeRepositoryImpl implements TypeRepository {
  final TypeRemoteDatasource datasource;

  TypeRepositoryImpl(this.datasource);

  @override
  Future<List<TypeEntity>> getTypes(String lang) async {
    final models = await datasource.getTypes(lang);
    return models.map((m) => m.toEntity(lang)).toList();
  }
}