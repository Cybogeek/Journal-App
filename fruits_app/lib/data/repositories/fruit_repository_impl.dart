import '../../domain/entities/fruit_entity.dart';
import '../../domain/repositories/fruit_repository.dart';
import '../datasource/fruit_remote_data_source.dart';

class FruitRepositoryImpl implements FruitRepository {
  final FruitRemoteDataSource remoteDataSource;

  FruitRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<FruitEntity>> getAllFruits() async {
    return await remoteDataSource.getAllFruits();
  }

  @override
  Future<FruitEntity> getFruitById(int id) async {
    return await remoteDataSource.getFruitById(id);
  }
}
