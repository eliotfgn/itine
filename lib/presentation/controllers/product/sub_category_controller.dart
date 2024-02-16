import 'package:get/get.dart';
import 'package:itine/core/services/api/products/sub_category_service.dart';
import 'package:itine/domains/models/sub_category/sub_category.dart';

class SubCategoryController extends GetxController {
  RxString activeCategory = ''.obs;

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  // }

  final SubCategoryService _subCategoryService = SubCategoryService();

  RxList<SubCategory> subCategories = <SubCategory>[].obs;

  getSubCategories() async {
    List<SubCategory> response =
        await _subCategoryService.getByCategory(activeCategory.value);

    print(response.map((e) => e.toJson()));
    subCategories.value = response;
  }
}
