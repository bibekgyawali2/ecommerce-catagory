import '../model/product_model.dart';
import '../resources/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<ProductModel>> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class NetworkError extends Error {}
