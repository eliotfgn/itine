import 'package:dio/dio.dart';
import 'package:itine/core/services/api/api_endpoints.dart';
import 'package:itine/core/services/api/base_api_service.dart';
import 'package:itine/domains/models/sub_category/sub_category.dart';

class SubCategoryService extends ApiService {
  Future<List<SubCategory>> getByCategory(String category) async {
    List<SubCategory> items = [];
    Response response =
        await client.get('${ApiEndpoints.subCategories}?category=$category');

    response.data['data'].forEach((item) {
      items.add(SubCategory.fromJson(item));
    });

    return items;
  }
}
