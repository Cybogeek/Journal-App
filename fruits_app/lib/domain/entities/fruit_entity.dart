class NutritionEntity {
  final double calories;
  final double fat;
  final double sugar;
  final double carbohydrates;
  final double protein;

  NutritionEntity({
    required this.calories,
    required this.fat,
    required this.sugar,
    required this.carbohydrates,
    required this.protein,
  });
}

class FruitEntity {
  final int id;
  final String name;
  final String family;
  final String order;
  final String genus;
  final NutritionEntity nutritions;

  FruitEntity({
    required this.id,
    required this.name,
    required this.family,
    required this.order,
    required this.genus,
    required this.nutritions,
  });
}
