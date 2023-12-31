import 'package:dio/dio.dart';
import 'package:itine/core/services/api/api_endpoints.dart';
import 'package:itine/core/services/api/base_api_service.dart';
import 'package:itine/domains/models/category/category.dart';
import 'package:itine/domains/models/product/product.dart';

enum Gender { man, woman, child }

class ProductService extends ApiService {
  Future<List<Product>> getAll() async {
    List<Product> products = [];

    Response response = await client.get(ApiEndpoints.products);

    response.data['data'].forEach((product) {
      products.add(Product.fromJson(product));
    });

    return products;
  }

  Future<List<Category>> getCategoriesByGender(Gender gender) async {
    List<Category> categories = [];

    Response response =
        await client.get('${ApiEndpoints.categories}?gender=${gender.name}');

    response.data['data'].forEach((category) {
      categories.add(Category.fromJson(category));
    });

    return categories;
  }

  Future<List<Product>> getProductsByCategoryAndGender(
      Gender gender, String category) async {
    List<Product> products = [];

    Response response = await client.get(
        '${ApiEndpoints.products}?gender=${gender.name}&category=$category');

    response.data['data'].forEach((product) {
      products.add(Product.fromJson(product));
    });

    return products;
  }

  Future<List<Product>> getProductsByGender(Gender gender) async {
    List<Product> products = [];

    Response response =
        await client.get('${ApiEndpoints.products}?gender=${gender.name}');

    response.data['data'].forEach((product) {
      products.add(Product.fromJson(product));
    });

    return products;
  }
}
