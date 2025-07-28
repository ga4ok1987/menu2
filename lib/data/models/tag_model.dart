import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_model.freezed.dart';

part 'tag_model.g.dart';

@freezed
abstract class TagModel with _$TagModel {
  const factory TagModel({
    @JsonKey(name: 'tag_translations') @Default([])
    List<TagTranslationModel>? translations,
  }) = _TagModel;

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);
}

@freezed
abstract class TagTranslationModel with _$TagTranslationModel {
  const factory TagTranslationModel({
    @JsonKey(name: 'language_code') @Default('uk') String languageCode,
     String? name,
  }) = _TagTranslationModel;

  factory TagTranslationModel.fromJson(Map<String, dynamic> json) =>
      _$TagTranslationModelFromJson(json);
}

@freezed
abstract class TagWrapperModel with _$TagWrapperModel {
  const factory TagWrapperModel({
    TagModel? tags,
  }) = _TagWrapperModel;

  factory TagWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$TagWrapperModelFromJson(json);
}

extension TagModelX on TagModel {
  String? getNameForLang(String lang) {
    if (translations == null || translations!.isEmpty) return null;

    return translations!.firstWhere(
          (t) => t.languageCode == lang,
      orElse: () => translations!.first,
    ).name;
  }
}