import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:menu2/core/locale/language_cubit.dart';
import 'package:menu2/presentation/blocs/dish_bloc.dart';
import 'package:menu2/presentation/blocs/info_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/DI/di.dart';
import 'core/config/env.dart';
import 'core/locale/availabel_language_cubit.dart';
import 'core/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseKey,
  );
  await configureDependencies();
  runApp(const AppWrapper());
}

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(create: (_) => getIt<LanguageCubit>(),),
        BlocProvider<AvailableLanguagesCubit>(create: (_) => getIt<AvailableLanguagesCubit>()..loadLanguages(),)
      ],

      child: const _MultiBlocWrapper(),
    );
  }
}

class _MultiBlocWrapper extends StatelessWidget {
  const _MultiBlocWrapper();

  @override
  Widget build(BuildContext context) {
    final locale = context.read<LanguageCubit>().state;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<DishBloc>()),
        BlocProvider(create: (_) => getIt<InfoBloc>()),
      ],
      child: Builder(
        builder: (context) {
          // 🔥 Ініціалізуємо одразу після побудови
          context.read<DishBloc>().add(LoadDishesEvent(locale.languageCode));
          context.read<InfoBloc>().add(LoadInfoEvent(locale.languageCode));

          return BlocListener<LanguageCubit, Locale>(
            listenWhen: (previous, current) =>
            previous.languageCode != current.languageCode,
            listener: (context, locale) {
              context.read<DishBloc>().add(LoadDishesEvent(locale.languageCode));
              context.read<InfoBloc>().add(LoadInfoEvent(locale.languageCode));
            },
            child: const MyApp(),
          );
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageCubit>().state;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Меню',
      theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        menuStyle: MenuStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    ),
      locale: locale,
      supportedLocales: const [Locale('uk'), Locale('en')],
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        ],
        child: child!,
      ),
      localizationsDelegates: [
        // AppLocalizations.delegate, // якщо використовуєш
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: router,
    );
  }
}