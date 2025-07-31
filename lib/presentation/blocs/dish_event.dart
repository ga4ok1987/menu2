part of 'dish_bloc.dart';
@freezed
sealed class DishEvent with _$DishEvent {
  const factory DishEvent.fetchAll({required String lang}) = _FetchAll;

  const factory DishEvent.changeSelectedType(int index) = _ChangeSelectedType;
}
