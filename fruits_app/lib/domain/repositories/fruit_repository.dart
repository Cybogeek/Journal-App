import '../entities/fruit_entity.dart';

abstract class FruitRepository {
  Future<List<FruitEntity>> getAllFruits();
  Future<FruitEntity> getFruitById(int id);
}
