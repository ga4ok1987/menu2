// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:menu2/core/DI/di.dart' as _i809;
import 'package:menu2/core/locale/language_cubit.dart' as _i994;
import 'package:menu2/data/datasources/dish_remote_data_source.dart' as _i414;
import 'package:menu2/data/datasources/info_remote_data_source.dart' as _i463;
import 'package:menu2/data/datasources/language_remote_data_source.dart'
    as _i351;
import 'package:menu2/data/repositories/dish_repository_impl.dart' as _i979;
import 'package:menu2/data/repositories/info_repository_impl.dart' as _i980;
import 'package:menu2/data/repositories/language_repository_impl.dart' as _i783;
import 'package:menu2/domain/repositories/dish_repository.dart' as _i551;
import 'package:menu2/domain/repositories/info_repository.dart' as _i915;
import 'package:menu2/domain/repositories/language_repository.dart' as _i661;
import 'package:menu2/domain/usecases/get_dishes.dart' as _i892;
import 'package:menu2/domain/usecases/get_info.dart' as _i406;
import 'package:menu2/domain/usecases/get_languages.dart' as _i591;
import 'package:menu2/presentation/blocs/dish_bloc.dart' as _i484;
import 'package:menu2/presentation/blocs/info_bloc.dart' as _i871;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final infoModule = _$InfoModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => infoModule.supabaseClient);
    gh.lazySingleton<_i994.LanguageCubit>(() => _i994.LanguageCubit());
    gh.factory<_i591.GetLanguagesUseCase>(
      () => _i591.GetLanguagesUseCase(gh<_i661.LanguageRepository>()),
    );
    gh.lazySingleton<_i463.InfoRemoteDataSource>(
      () => _i463.InfoRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i351.LanguageRemoteDataSource>(
      () => _i351.LanguageRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i414.DishRemoteDataSource>(
      () => _i414.DishRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i783.LanguageRepositoryImpl>(
      () => _i783.LanguageRepositoryImpl(gh<_i351.LanguageRemoteDataSource>()),
    );
    gh.lazySingleton<_i551.DishRepository>(
      () => _i979.DishRepositoryImpl(gh<_i414.DishRemoteDataSource>()),
    );
    gh.lazySingleton<_i915.InfoRepository>(
      () => _i980.InfoRepositoryImpl(gh<_i463.InfoRemoteDataSource>()),
    );
    gh.lazySingleton<_i892.FetchDishesUseCase>(
      () => _i892.FetchDishesUseCase(gh<_i551.DishRepository>()),
    );
    gh.factory<_i484.DishBloc>(
      () => _i484.DishBloc(gh<_i551.DishRepository>()),
    );
    gh.factory<_i871.InfoBloc>(
      () => _i871.InfoBloc(gh<_i915.InfoRepository>()),
    );
    gh.lazySingleton<_i406.GetInfo>(
      () => _i406.GetInfo(gh<_i915.InfoRepository>()),
    );
    return this;
  }
}

class _$InfoModule extends _i809.InfoModule {}
