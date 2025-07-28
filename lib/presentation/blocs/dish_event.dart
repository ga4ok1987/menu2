part of 'dish_bloc.dart';

sealed class DishEvent extends Equatable {
  const DishEvent();

  @override
  List<Object?> get props => [];
}

class LoadDishesEvent extends DishEvent {
  final String lang;

  const LoadDishesEvent(this.lang);

  @override
  List<Object?> get props => [lang];
}