class ApiConstants {
  static const String baseUrl = 'https://www.fruityvice.com/api/fruit';
  static const String allFruits = '$baseUrl/all';

  static String fruitById(int id) => '$baseUrl/$id';
}
