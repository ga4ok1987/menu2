import 'dart:ui';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LanguageCubit extends HydratedCubit<Locale> {
  LanguageCubit() : super(const Locale('uk'));

  void setLocale(Locale locale) => emit(locale);

  @override
  Locale fromJson(Map<String, dynamic> json) =>
      Locale(json['languageCode'] as String);

  @override
  Map<String, dynamic> toJson(Locale state) => {
    'languageCode': state.languageCode,
  };
}
