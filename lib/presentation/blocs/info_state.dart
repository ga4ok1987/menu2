part of 'info_bloc.dart';

sealed class InfoState extends Equatable {
  const InfoState();

  @override
  List<Object?> get props => [];
}

class InfoInitial extends InfoState {}

class InfoLoading extends InfoState {}

class InfoLoaded extends InfoState {
  final InfoEntity info;

  const InfoLoaded(this.info);

  @override
  List<Object?> get props => [info];
}

class InfoError extends InfoState {
  final String message;

  const InfoError(this.message);

  @override
  List<Object?> get props => [message];
}