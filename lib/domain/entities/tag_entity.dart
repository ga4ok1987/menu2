import 'package:equatable/equatable.dart';

class TagEntity extends Equatable {
  final String id;
  final String code;
  final String name;

  const TagEntity({
    required this.id,
    required this.code,
    required this.name,
  });

  @override
  List<Object?> get props => [id, code, name];
}