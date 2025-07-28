import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/info_entity.dart';

part 'info_model.freezed.dart';
part 'info_model.g.dart';

@freezed
abstract class InfoModel with _$InfoModel {
  const factory InfoModel({
    required int id,
    required String code,
    required String phone,
    required String email,
    @Default(0.0) double lat,
    @Default(0.0) double lon,
    @JsonKey(name: 'image_url') String? imageUrl,

    @JsonKey(name: 'info_translations') required List<InfoTranslationModel> translations,
  }) = _InfoModel;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);
}

@freezed
abstract class InfoTranslationModel with _$InfoTranslationModel {
  const factory InfoTranslationModel({
    required String language_code,
    required String name,
    required String address,
    required String about,
  }) = _InfoTranslationModel;

  factory InfoTranslationModel.fromJson(Map<String, dynamic> json) =>
      _$InfoTranslationModelFromJson(json);
}

extension InfoModelX on InfoModel {
  InfoEntity toEntity(String lang) {

    final translation = translations.firstWhere(
          (t) => t.language_code == lang,
      orElse: () => translations.first,
    );
    return InfoEntity(
      id: id,
      code: code,
      phone: phone,
      email: email,
      lat: lat,
      lon: lon,
      name: translation.name,
      address: translation.address,
      about: translation.about,
      imageUrl: imageUrl??'',
    );
  }
}