import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/dish_entity.dart';
import 'tag_model.dart';
import 'type_model.dart';

part 'dish_model.freezed.dart';

part 'dish_model.g.dart';

@freezed
abstract class DishModel with _$DishModel {
  const factory DishModel({
    required int id,
    @JsonKey(name: 'image_url') String? imageUrl,
    required double price,
    String? weight,
    int? likes,
    @JsonKey(name: 'dish_translations')
    @Default([])
    List<DishTranslationModel> translations,
    @JsonKey(name: 'types') TypeModel? type,
    @JsonKey(name: 'dish_tags')
    @Default(<TagWrapperModel>[])
    List<TagWrapperModel> tags,
  }) = _DishModel;

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);
}

@freezed
abstract class DishTranslationModel with _$DishTranslationModel {
  const factory DishTranslationModel({
    required String language_code,
    required String name,
    String? description,
  }) = _DishTranslationModel;

  factory DishTranslationModel.fromJson(Map<String, dynamic> json) =>
      _$DishTranslationModelFromJson(json);
}

extension DishModelX on DishModel {
  DishEntity toEntity(String lang) {
    final translation = translations.firstWhere(
          (t) => t.language_code == lang,
      orElse: () => translations.first,
    );

    return DishEntity(
      id: id,
      imageUrl: imageUrl,
      price: price,
      weight: weight,
      likes: likes,
      name: translation.name,
      description: translation.description,
      typeName: type?.toEntity(lang),
      tagNames: tags
          .map((tag) => tag.tags?.getNameForLang(lang))
          .whereType<String>()
          .toList(),
    );
  }
}
