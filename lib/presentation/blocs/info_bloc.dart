
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:menu2/domain/entities/info_entity.dart';
import 'package:menu2/domain/repositories/info_repository.dart';

part 'info_event.dart';
part 'info_state.dart';

@injectable
class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final InfoRepository repository;

  InfoBloc(this.repository) : super(InfoInitial()) {
    on<LoadInfoEvent>(_onLoadInfo);
  }

  Future<void> _onLoadInfo(LoadInfoEvent event, Emitter<InfoState> emit) async {
    emit(InfoLoading());
    try {
      final info = await repository.getInfo(event.lang);
      emit(InfoLoaded(info));
    } catch (e) {
      print(e.toString());
      emit(InfoError(e.toString()));
    }
  }
}