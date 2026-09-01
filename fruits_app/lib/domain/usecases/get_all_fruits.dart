import '../entities/fruit_entity.dart';
import '../repositories/fruit_repository.dart';

class GetAllFruits {
  final FruitRepository repository;

  GetAllFruits(this.repository);

  Future<List<FruitEntity>> call() {
    return repository.getAllFruits();
  }
}
