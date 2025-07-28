import 'package:flutter/material.dart';

class UnitsLocalizer {
  final String lang;

  UnitsLocalizer(this.lang);

  String get currency => lang == 'en' ? 'UAH' : 'грн.';
  String get grams => lang == 'en' ? 'grams' : 'грам';
  String get price => lang == 'en' ? 'Price' : 'Ціна';
  String get weight => lang == 'en' ? 'Weight' : 'Вага';
  String get menu => lang == 'en' ? 'MENU' : 'МЕНЮ';
}

extension UnitsExtension on BuildContext {
  UnitsLocalizer get units =>
      UnitsLocalizer(Localizations.localeOf(this).languageCode);
}