part of 'info_bloc.dart';

sealed class InfoEvent extends Equatable {
  const InfoEvent();

  @override
  List<Object?> get props => [];
}

class LoadInfoEvent extends InfoEvent {
  final String lang;

  const LoadInfoEvent(this.lang);

  @override
  List<Object?> get props => [lang];
}