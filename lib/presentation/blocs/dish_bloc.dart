import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:menu2/domain/usecases/get_types.dart';

import '../../../domain/entities/dish_entity.dart';
import '../../domain/entities/type_entity.dart';
import '../../domain/usecases/get_dishes.dart';

part 'dish_event.dart';

part 'dish_state.dart';

part 'dish_bloc.freezed.dart';

@injectable
class DishBloc extends Bloc<DishEvent, DishState> {
  final GetDishesUseCase getDishes;
  final GetTypesUseCase getTypes;

  DishBloc(this.getDishes, this.getTypes) : super(const DishState.loading()) {
    on<_FetchAll>(_onFetchAll);
    on<_ChangeSelectedType>(_onChangeSelectedType);
  }

  Future<void> _onFetchAll(_FetchAll event, Emitter<DishState> emit) async {
    emit(const DishState.loading());
    final allType = TypeEntity(id: -1, name: event.lang == 'en' ? 'All' : 'Всі');
    try {
      final types = await getTypes.repository.getTypes(event.lang);
      types.insert(0, allType);
      types.sort((a,b) => a.id.compareTo((b.id)));
      final allDishes = await getDishes.repository.getDishes(event.lang);
      allDishes.sort((a,b) => a.id.compareTo((b.id)));

      // 🧠 Групування по типу
      final grouped = <int, List<DishEntity>>{};
      for (final type in types) {
        if (type.id == -1) {
          grouped[-1] = allDishes;

        } else{
        grouped[type.id] = allDishes
            .where((dish) => dish.typeName?.id == type.id)
            .toList();
      }}

      emit(
        DishState.loaded(
          types: types,
          groupedDishes: grouped,
          selectedTypeIndex: 0,
        ),
      );
    } catch (e) {
      emit(DishState.error(e.toString()));
    }
  }

  void _onChangeSelectedType(
    _ChangeSelectedType event,
    Emitter<DishState> emit,
  ) {
    final current = state;
    if (current is DishLoaded) {
      emit(current.copyWith(selectedTypeIndex: event.index));
    }
  }
}
