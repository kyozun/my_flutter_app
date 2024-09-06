import 'package:crudproduct/models/product.dart';

abstract class ProductApiService {
  Future<List<Product>> fetchProducts();
  Future<void> addProduct(Product product);
  Future<void> updateProduct(String id, Product product);
  Future<void> deleteProduct(String id);
}
