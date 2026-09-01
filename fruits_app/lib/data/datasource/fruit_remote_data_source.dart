import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/constants/api_constants.dart';
import '../../core/error/app_exception.dart';
import '../models/fruit_model.dart';

abstract class FruitRemoteDataSource {
  Future<List<FruitModel>> getAllFruits();
  Future<FruitModel> getFruitById(int id);
}

class FruitRemoteDataSourceImpl implements FruitRemoteDataSource {
  final http.Client client;

  FruitRemoteDataSourceImpl(this.client);

  @override
  Future<List<FruitModel>> getAllFruits() async {
    final response = await client.get(Uri.parse(ApiConstants.allFruits));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return FruitModel.listFromJson(data);
    } else {
      throw AppException('Failed to load fruits list');
    }
  }

  @override
  Future<FruitModel> getFruitById(int id) async {
    final response = await client.get(Uri.parse(ApiConstants.fruitById(id)));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return FruitModel.fromJson(data);
    } else {
      throw AppException('Failed to load fruit details');
    }
  }
}
