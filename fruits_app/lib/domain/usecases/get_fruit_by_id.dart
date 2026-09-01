import '../entities/fruit_entity.dart';
import '../repositories/fruit_repository.dart';

class GetFruitById {
  final FruitRepository repository;

  GetFruitById(this.repository);

  Future<FruitEntity> call(int id) {
    return repository.getFruitById(id);
  }
}
