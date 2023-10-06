import 'package:get/get.dart';
import 'package:itine/core/services/api/products/product_service.dart';
import 'package:itine/domains/models/product/product.dart';

class ProductsController extends GetxController {
  final ProductService _productService = ProductService();

  RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    products.value = await _productService.getAll();
  }
}
