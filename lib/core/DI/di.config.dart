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
import 'package:menu2/data/datasources/dish_data_source.dart' as _i73;
import 'package:menu2/data/repositories/dish_repository_impl.dart' as _i979;
import 'package:menu2/domain/repositories/dish_repository.dart' as _i551;
import 'package:menu2/domain/usecases/get_dishes.dart' as _i892;
import 'package:menu2/presentation/blocs/main_bloc.dart' as _i679;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i73.DishDataSource>(() => _i73.DishDataSource());
    gh.lazySingleton<_i551.DishRepository>(
      () => _i979.DishRepositoryImpl(gh<_i73.DishDataSource>()),
    );
    gh.factory<_i679.MainBloc>(
      () => _i679.MainBloc(gh<_i551.DishRepository>()),
    );
    gh.lazySingleton<_i892.GetDishes>(
      () => _i892.GetDishes(gh<_i551.DishRepository>()),
    );
    return this;
  }
}
