import 'package:crudproduct/models/product.dart';
import 'package:crudproduct/services/product_service.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<void> createProduct(Product product);
  Future<void> updateProduct(String id, Product product);
  Future<void> removeProduct(String id);
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService apiService;

  ProductRepositoryImpl(this.apiService);

  @override
  Future<List<Product>> getProducts() {
    return apiService.fetchProducts();
  }

  @override
  Future<void> createProduct(Product product) {
    return apiService.addProduct(product);
  }

  @override
  Future<void> updateProduct(String id, Product product) {
    return apiService.updateProduct(id, product);
  }

  @override
  Future<void> removeProduct(String id) {
    return apiService.deleteProduct(id);
  }
}
