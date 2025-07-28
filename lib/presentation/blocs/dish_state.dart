part of 'dish_bloc.dart';

sealed class DishState extends Equatable {
  const DishState();

  @override
  List<Object?> get props => [];
}

class DishInitial extends DishState {}

class DishLoading extends DishState {}

class DishLoaded extends DishState {
  final List<DishEntity> dishes;

  const DishLoaded(this.dishes);

  @override
  List<Object?> get props => [dishes];
}

class DishError extends DishState {
  final String message;

  const DishError(this.message);

  @override
  List<Object?> get props => [message];
}