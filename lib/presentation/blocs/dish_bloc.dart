import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:menu2/domain/entities/dish_entity.dart';
import 'package:menu2/domain/repositories/dish_repository.dart';

part 'dish_event.dart';

part 'dish_state.dart';

@injectable
class DishBloc extends Bloc<DishEvent, DishState> {
  final DishRepository repository;

  DishBloc(this.repository) : super(DishInitial()) {
    on<LoadDishesEvent>(_onLoadDishes);
  }

  Future<void> _onLoadDishes(
    LoadDishesEvent event,
    Emitter<DishState> emit,
  ) async {
    emit(DishLoading());
    try {
      final dishes = await repository.fetchDishes(event.lang);
      emit(DishLoaded(dishes));
    } catch (e) {
      print(e.toString());

      emit(DishError(e.toString()));
    }
  }
}
