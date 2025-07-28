import 'package:injectable/injectable.dart';
import 'package:menu2/data/models/info_model.dart';
import '../../domain/entities/info_entity.dart';
import '../../domain/repositories/info_repository.dart';
import '../datasources/info_remote_data_source.dart';

@LazySingleton(as: InfoRepository)
class InfoRepositoryImpl implements InfoRepository {
  final InfoRemoteDataSource remote;

  InfoRepositoryImpl(this.remote);

  @override
  Future<InfoEntity> getInfo(String languageCode) async {
    InfoModel model = await remote.getInfo(languageCode);
    return model.toEntity(languageCode);
  }
}