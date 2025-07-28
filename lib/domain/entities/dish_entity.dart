import 'package:equatable/equatable.dart';

class DishEntity extends Equatable {
  final int id;
  final String? imageUrl;
  final double price;
  final String? weight;
  final int? likes;

  final String? name;
  final String? description;
  final String? typeName;
  final List<String> tagNames;

  const DishEntity({
    required this.id,
    this.imageUrl,
    required this.price,
    this.weight,
    this.likes,
     this.name,
    this.description,
    this.typeName,
    this.tagNames = const [],
  });

  @override
  List<Object?> get props => [
    id,
    imageUrl,
    price,
    weight,
    likes,
    name,
    description,
    typeName,
    tagNames,
  ];
}
