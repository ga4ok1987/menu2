part of 'dish_bloc.dart';

@freezed
sealed class DishState with _$DishState {
  const factory DishState.loading() = DishLoading;
  const factory DishState.loaded({
    required List<TypeEntity> types,
    required Map<int, List<DishEntity>> groupedDishes,
    required int selectedTypeIndex,
  }) = DishLoaded;
  const factory DishState.error(String message) = DishError;
}