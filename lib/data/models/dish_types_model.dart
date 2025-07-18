import 'package:menu2/domain/entities/dish_types.dart';

class DishTypesModel extends DishTypes {
  DishTypesModel({required super.id, required super.title});

  factory DishTypesModel.fromJson(Map<String, dynamic> json) =>
      DishTypesModel(id: json['id'], title: 'type');
}
