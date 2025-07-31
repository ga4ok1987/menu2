import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/type_entity.dart';

part 'type_model.freezed.dart';
part 'type_model.g.dart';

@freezed
abstract class TypeModel with _$TypeModel {
  const factory TypeModel({
    required int id,
    required String code,
    @JsonKey(name: 'type_translations') @Default([]) List<TypeTranslationModel> translations,
  }) = _TypeModel;

  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      _$TypeModelFromJson(json);
}

@freezed
abstract class TypeTranslationModel with _$TypeTranslationModel {
  const factory TypeTranslationModel({
     String? language_code,
     String? name,
  }) = _TypeTranslationModel;

  factory TypeTranslationModel.fromJson(Map<String, dynamic> json) =>
      _$TypeTranslationModelFromJson(json);
}

extension TypeModelX on TypeModel {
  TypeEntity toEntity(String lang) {
    final name = translations.firstWhere(
          (t) => t.language_code == lang,
      orElse: () => translations.first,
    ).name;
    return TypeEntity(id: id, name: name??'');
  }

  String? getNameForLang(String lang) {
    return translations.firstWhere(
          (t) => t.language_code == lang,
      orElse: () => translations.first,
    ).name;
  }
}