import 'package:dio/dio.dart';
import 'package:itine/core/services/api/api_endpoints.dart';
import 'package:itine/core/services/api/base_api_service.dart';
import 'package:itine/domains/models/category/category.dart';
import 'package:itine/domains/models/product/product.dart';
import 'package:itine/domains/models/wishlist/wishlist_item.dart';

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

  Future<WishlistItem?> addToWishlist(int productId) async {
    Response response = await client.post(
      ApiEndpoints.wishlist,
      data: {
        'productId': productId,
        'userId': 1,
      },
    );
    return response.data['data'];
  }

  Future<List<WishlistItem>> getWishlistItems(int userId) async {
    List<WishlistItem> items = [];

    Response response = await client.get('${ApiEndpoints.wishlist}/$userId');
    response.data['data'].forEach((item) {
      items.add(WishlistItem.fromJson(item));
    });

    return items;
  }

  Future<bool> deleteWishlistItem(int id) async {
    Response response = await client.delete('${ApiEndpoints.wishlist}/$id');

    return response.data['success'];
  }
}
