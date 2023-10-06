import 'package:dio/dio.dart';
import 'package:itine/core/services/api/api_endpoints.dart';
import 'package:itine/core/services/api/base_api_service.dart';
import 'package:itine/domains/models/product/product.dart';

class ProductService extends ApiService {
  Future<List<Product>> getAll() async {
    List<Product> products = [];

    Response response = await client.get(ApiEndpoints.products);

    response.data['data'].forEach((product) {
      products.add(Product.fromJson(product));
    });

    return products;
  }
}
