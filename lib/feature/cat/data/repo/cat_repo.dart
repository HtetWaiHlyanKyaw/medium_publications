import 'package:medium_publications/feature/cat/domain/model/cat.dart';
import 'package:medium_publications/service/api_service.dart';

class CatRepo {
  final ApiService _apiService = ApiService();

  Future<List<Cat>> getCats() async {
    try {
      final cats = await _apiService.getCats();

      if (cats.isNotEmpty) {
        return cats.map((cat) => Cat.fromJson(cat)).toList();
      }

      return [];
    } catch (e) {
      rethrow;
    }
  }
}
