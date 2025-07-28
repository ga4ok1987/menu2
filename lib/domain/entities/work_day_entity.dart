import 'package:equatable/equatable.dart';

class WorkDayEntity extends Equatable {
  final String id;
  final int weekday;
  final String openTime;
  final String closeTime;
  final bool isClosed;
  final String title;

  const WorkDayEntity({
    required this.id,
    required this.weekday,
    required this.openTime,
    required this.closeTime,
    required this.isClosed,
    required this.title,
  });

  @override
  List<Object?> get props => [
    id,
    weekday,
    openTime,
    closeTime,
    isClosed,
    title,
  ];
}