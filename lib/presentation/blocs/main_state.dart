part of 'main_bloc.dart';

sealed class MainState extends Equatable {
  const MainState();
}

final class MainInitial extends MainState {
  final List<Dish> dishes;

  const MainInitial({required this.dishes});

  MainInitial copyWith({List<Dish>? dishes}) {
    return MainInitial(dishes: dishes ?? this.dishes);
  }

  @override
  List<Object> get props => [dishes];
}
