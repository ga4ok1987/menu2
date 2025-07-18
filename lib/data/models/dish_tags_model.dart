import '../../domain/entities/dish_tags.dart';

class DishTagsModel extends DishTags {
  DishTagsModel({required super.id, required super.title});

  factory DishTagsModel.fromJson(Map<String, dynamic> json) =>
      DishTagsModel(id: json['id'], title: 'type');
}
