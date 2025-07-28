import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/work_day_entity.dart';

part 'work_day_model.freezed.dart';
part 'work_day_model.g.dart';

@freezed
abstract class WorkDayModel with _$WorkDayModel {
  const factory WorkDayModel({
    required String id,
    required int weekday,
    @JsonKey(name: 'open_time') required String openTime,
    @JsonKey(name: 'close_time') required String closeTime,
    @JsonKey(name: 'is_closed') required bool isClosed,
    @JsonKey(name: 'weekdays_translations') required List<WeekdayTranslationModel> translations,
  }) = _WorkDayModel;

  factory WorkDayModel.fromJson(Map<String, dynamic> json) =>
      _$WorkDayModelFromJson(json);
}

@freezed
abstract class WeekdayTranslationModel with _$WeekdayTranslationModel {
  const factory WeekdayTranslationModel({
    required String language_code,
    required String title,
  }) = _WeekdayTranslationModel;

  factory WeekdayTranslationModel.fromJson(Map<String, dynamic> json) =>
      _$WeekdayTranslationModelFromJson(json);
}

extension WorkDayModelX on WorkDayModel {
  WorkDayEntity toEntity(String lang) {
    final title = translations.firstWhere(
          (t) => t.language_code == lang,
      orElse: () => translations.first,
    ).title;

    return WorkDayEntity(
      id: id,
      weekday: weekday,
      openTime: openTime,
      closeTime: closeTime,
      isClosed: isClosed,
      title: title,
    );
  }
}