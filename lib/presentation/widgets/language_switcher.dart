import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/locale/language_cubit.dart';

class LanguageSwitcher extends StatelessWidget {
  final Map<String, String> languages; // {'uk': 'Українська', 'en': 'English'}

  const LanguageSwitcher({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, currentLocale) {
        return DropdownButton<String>(
          value: currentLocale.languageCode,
          icon: const Icon(Icons.language),
          underline: const SizedBox(),
          onChanged: (String? newCode) {
            if (newCode != null) {
              context.read<LanguageCubit>().setLocale(Locale(newCode));
            }
          },
          items: languages.entries.map((entry) {
            return DropdownMenuItem<String>(
              value: entry.key,
              child: Text(entry.value),
            );
          }).toList(),
        );
      },
    );
  }
}