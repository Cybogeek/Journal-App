import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http;

import '../../data/datasource/fruit_remote_data_source.dart';
import '../../data/repositories/fruit_repository_impl.dart';
import '../../domain/entities/fruit_entity.dart';
import '../../domain/usecases/get_all_fruits.dart';
import '../../domain/usecases/get_fruit_by_id.dart';

final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

final fruitRemoteDataSourceProvider = Provider<FruitRemoteDataSource>((ref) {
  return FruitRemoteDataSourceImpl(ref.read(httpClientProvider));
});

final fruitRepositoryProvider = Provider((ref) {
  return FruitRepositoryImpl(ref.read(fruitRemoteDataSourceProvider));
});

final getAllFruitsUseCaseProvider = Provider((ref) {
  return GetAllFruits(ref.read(fruitRepositoryProvider));
});

final getFruitByIdUseCaseProvider = Provider((ref) {
  return GetFruitById(ref.read(fruitRepositoryProvider));
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final allFruitsProvider = FutureProvider<List<FruitEntity>>((ref) async {
  return ref.read(getAllFruitsUseCaseProvider).call();
});

final filteredFruitsProvider = Provider<AsyncValue<List<FruitEntity>>>((ref) {
  final fruitsAsync = ref.watch(allFruitsProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase().trim();

  return fruitsAsync.whenData((fruits) {
    if (query.isEmpty) return fruits;
    return fruits
        .where((fruit) => fruit.name.toLowerCase().contains(query))
        .toList();
  });
});

final fruitByIdProvider = FutureProvider.family<FruitEntity, int>((
  ref,
  id,
) async {
  return ref.read(getFruitByIdUseCaseProvider).call(id);
});
