import 'package:equatable/equatable.dart';

class TypeEntity extends Equatable {
  final int id;
  final String code;
  final String name;

  const TypeEntity({
    required this.id,
    required this.code,
    required this.name,
  });

  @override
  List<Object?> get props => [id, code, name];
}