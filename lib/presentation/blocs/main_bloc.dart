import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:menu2/domain/repositories/dish_repository.dart';

import '../../domain/entities/dish.dart';

part 'main_event.dart';

part 'main_state.dart';


@injectable
class MainBloc extends Bloc<MainEvent, MainInitial> {
  final DishRepository? repo;
  MainBloc(this.repo) : super(MainInitial(dishes: [])) {
    on<MainInitEvent>(_onInit);
  }

  Future<void> _onInit(MainInitEvent event, Emitter<MainInitial> emit) async {
    try {
      final dishes = await repo?.getDishes();

      emit(state.copyWith(dishes: dishes));
    } catch (e) {
      print(e);
    }
  }
}
