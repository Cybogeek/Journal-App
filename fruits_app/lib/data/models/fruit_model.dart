import '../../domain/entities/fruit_entity.dart';

class NutritionModel extends NutritionEntity {
  NutritionModel({
    required super.calories,
    required super.fat,
    required super.sugar,
    required super.carbohydrates,
    required super.protein,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      calories: (json['calories'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
      sugar: (json['sugar'] as num).toDouble(),
      carbohydrates: (json['carbohydrates'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'fat': fat,
      'sugar': sugar,
      'carbohydrates': carbohydrates,
      'protein': protein,
    };
  }
}

class FruitModel extends FruitEntity {
  FruitModel({
    required super.id,
    required super.name,
    required super.family,
    required super.order,
    required super.genus,
    required NutritionModel super.nutritions,
  });

  factory FruitModel.fromJson(Map<String, dynamic> json) {
    return FruitModel(
      id: json['id'] as int,
      name: json['name'] as String,
      family: json['family'] as String,
      order: json['order'] as String,
      genus: json['genus'] as String,
      nutritions: NutritionModel.fromJson(json['nutritions']),
    );
  }

  static List<FruitModel> listFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((json) => FruitModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'family': family,
      'order': order,
      'genus': genus,
      'nutritions': (nutritions as NutritionModel).toJson(),
    };
  }
}
